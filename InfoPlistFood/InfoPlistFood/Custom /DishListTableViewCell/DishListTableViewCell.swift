//
//  DishListTableViewCell.swift
//  InfoPlistFood
//
//  Created by сергей on 16.10.22.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static var identifier = "DishListTableViewCell"

    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var titleLbl: UILabel!
    
    @IBOutlet var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
