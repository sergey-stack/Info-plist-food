//
//  DishCategory.swift
//  InfoPlistFood
//
//  Created by сергей on 10.10.22.
//

import Foundation
struct DishCategory: Decodable {
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
