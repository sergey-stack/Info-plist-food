//
//  DishDetailViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 15.10.22.
//

import ProgressHUD
import UIKit

class DishDetailViewController: UIViewController {
    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var titleLbl: UILabel!
    
    @IBOutlet var caloriesLbl: UILabel!
    
    @IBOutlet var descriptionLbl: UILabel!
    
    @IBOutlet var nameField: UITextField!
    
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
        guard let coment = nameField.text?.trimmingCharacters(in: .whitespaces),
              !coment.isEmpty
        else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", coment: coment) {
            result in
            switch result {
            case .success:
                ProgressHUD.showSuccess("Your order has been received.👨‍🍳")
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
