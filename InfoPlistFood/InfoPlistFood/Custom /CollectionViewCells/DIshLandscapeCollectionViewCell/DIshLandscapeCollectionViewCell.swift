//
//  DIshLandscapeCollectionViewCell.swift
//  InfoPlistFood
//
//  Created by сергей on 14.10.22.
//

import UIKit

class DIshLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DIshLandscapeCollectionViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }

}
