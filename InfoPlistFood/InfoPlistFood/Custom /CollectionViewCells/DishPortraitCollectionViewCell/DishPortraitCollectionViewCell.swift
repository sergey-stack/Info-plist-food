//
//  DishPortraitCollectionViewCell.swift
//  InfoPlistFood
//
//  Created by сергей on 14.10.22.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishPortraitCollectionViewCell"

    @IBOutlet var titleLbl: UILabel!
    
    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var caloriesLbl: UILabel!
    
    @IBOutlet var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
