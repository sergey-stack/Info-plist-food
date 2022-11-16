//
//  Order.swift
//  InfoPlistFood
//
//  Created by сергей on 18.10.22.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
