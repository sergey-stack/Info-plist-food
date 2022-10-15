//
//  DishDetailViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 15.10.22.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!

    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

        
    }
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    
    @IBAction func placeOrderBtn(_ sender: UIButton) {
    }
    
  

}
