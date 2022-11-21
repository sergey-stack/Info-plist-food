//
//  UIViewController+Extension.swift
//  InfoPlistFood
//
//  Created by сергей on 15.10.22.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
