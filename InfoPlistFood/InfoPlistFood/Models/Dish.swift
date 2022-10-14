//
//  Dish.swift
//  InfoPlistFood
//
//  Created by сергей on 14.10.22.
//

import Foundation
struct Dish {
    let id : String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return  "\( calories ?? 0) calories"
    }
    
    
}
