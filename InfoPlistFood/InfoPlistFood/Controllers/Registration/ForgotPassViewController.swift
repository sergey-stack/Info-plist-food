//
//  ForgotPassViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 3.10.22.
//

import FirebaseAuth
import UIKit

class ForgotPassViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotPassAction(_ sender: UIButton) {
        let email = emailTF.text!
        if !email.isEmpty {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error == nil {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
}
