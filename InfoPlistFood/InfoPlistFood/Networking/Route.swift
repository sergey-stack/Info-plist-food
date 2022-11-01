//
//  Route.swift
//  InfoPlistFood
//
//  Created by сергей on 21.10.22.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/dish-categories"
            
        }
        
    }
}
