//
//  ApiResponse.swift
//  InfoPlistFood
//
//  Created by сергей on 27.10.22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
    
}
