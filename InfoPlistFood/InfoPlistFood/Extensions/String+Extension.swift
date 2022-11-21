//
//  String+Extension.swift
//  InfoPlistFood
//
//  Created by сергей on 10.10.22.
//

import Foundation
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

