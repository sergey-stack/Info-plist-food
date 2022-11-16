//
//  Route.swift
//  InfoPlistFood
//
//  Created by сергей on 21.10.22.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"//возврат все категории из апи(бз)
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"//добавляем заказ в бз
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"//возвр блюда по кат
        case .fetchOrders:
            return "/orders"//возв заказы
            
        }
        
    }
}
