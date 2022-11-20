//
//  DIshLandscapeCollectionViewCell.swift
//  InfoPlistFood
//
//  Created by сергей on 14.10.22.
//

import UIKit

class DIshLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = "DIshLandscapeCollectionViewCell"
    
    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var titleLbl: UILabel!
    
    @IBOutlet var descriptionLbl: UILabel!
    
    @IBOutlet var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}
