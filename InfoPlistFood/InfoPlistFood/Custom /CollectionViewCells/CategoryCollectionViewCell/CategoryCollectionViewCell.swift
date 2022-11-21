//
//  CategoryCollectionViewCell.swift
//  InfoPlistFood
//
//  Created by сергей on 11.10.22.
//

import Kingfisher
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet var categoryImageView: UIImageView!
    
    @IBOutlet var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
