//
//  AllDishes.swift
//  InfoPlistFood
//
//  Created by сергей on 1.11.22.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
}
