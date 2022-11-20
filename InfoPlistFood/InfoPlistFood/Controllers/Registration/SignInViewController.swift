//
//  SignInViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import Firebase
import UIKit

class SignInViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInAction(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
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
    }
}
