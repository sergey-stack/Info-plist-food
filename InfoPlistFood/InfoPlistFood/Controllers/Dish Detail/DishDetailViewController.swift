//
//  DishDetailViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 15.10.22.
//

import UIKit
import ProgressHUD

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
        guard let coment = nameField.text?.trimmingCharacters(in: .whitespaces),
              !coment.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", coment: coment) {
        (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.👨‍🍳")
                
                
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
  

}
