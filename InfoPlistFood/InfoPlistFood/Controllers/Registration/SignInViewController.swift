//
//  SignInViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import UIKit
import Firebase


class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        guard let email = emailTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] firebaseResult, error in
            if let error = error {
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let defaulAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(defaulAction)
                self?.present(alertController, animated: true, completion: nil)
            }
            else {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
                
            }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
   // }
//}
}
