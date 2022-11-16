//
//  NetworkService.swift
//  InfoPlistFood
//
//  Created by сергей on 21.10.22.
//

import Foundation

struct NetworkService {
   static let shared = NetworkService()
    private init() {}
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>)  -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
        
    }
    
    func placeOrder(dishId: String, coment: String, completion: @escaping(Result<Order, Error>) -> Void) {
        let params = [ "name": coment]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
        
    }
    
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>) ->Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    func fetchOrders(completion: @escaping(Result<[Order],  Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
        
        
    }
    
    private func request <T: Decodable>(route: Route,
                                      method: Method,
                                      parameters: [String: Any]? = nil,
                                      
                                      completion:@escaping (Result<T, Error>) -> Void) {
        guard  let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppErro.unknowError))
            
            
            
            return
            
        }
        
        URLSession.shared.dataTask(with: request) {data, responce, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
               print("The response is\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("This error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppErro.unknowError))
            return
        }

        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppErro.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppErro.serverError(error)))
                return
            }
            
            if let decodeData = response.data {
                completion(.success(decodeData))
                
            }else {
                completion(.failure(AppErro.unknowError))
            }
            
            
            
        case .failure(let error):
            completion(.failure(error))
        }
    }// говорит о том что есть ли ошибка
    
    
    
    
    /// This function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: the path the the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information me need to pass to the backend
    /// - Returns: URLRequest
    private  func createRequest(route: Route,
                                method: Method,
                                parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")// хедер
        urlRequest.httpMethod = method.rawValue
        if let params = parameters {
            switch method {
                
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
                
            case .post:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
