//
//  SignUpViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var nameTF: UITextField!
    
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet weak var errorLblEmail: UILabel!
    
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet weak var errorLblPassword: UILabel!
    
    @IBOutlet var repeatPasswordTF: UITextField!
    
    @IBOutlet weak var errorLblRepeatePassword: UILabel!
    @IBOutlet weak var continueSignUp: UIButton!
    
    // MARK: -  Properties
    private var isValidEmail = false { didSet {updateContinueBtnState() }}
    private var isConfPass = false { didSet { updateContinueBtnState()  }}
    private var pass = false { didSet { updateContinueBtnState() }}
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Func-s
    
    @IBAction func emailAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           Verification.isValidEmail(email: email)
        {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorLblEmail.isHidden = isValidEmail
    }
    
    @IBAction func passwordAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty,
           Verification.isValidPassword(pass: passText)
        {
            pass = true
        } else {
            pass = false
        }
        errorLblPassword.isHidden = pass

    }
    
    
    @IBAction func passwordRepeatAction(_ sender: UITextField) {
        if let passTexts = sender.text,
           !passTexts.isEmpty,
           Verification.isPassCofirm(pass1: passTexts, pass2: passwordTF.text!)
        {
            isConfPass = true
        } else {
            isConfPass = false
        }
        errorLblRepeatePassword.isHidden = isConfPass

    }
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        guard nameTF.text != nil else { return }
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                let alertController = UIAlertController(title: "You are already registered", message: error.localizedDescription, preferredStyle: .alert)
                            let defaulAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                            alertController.addAction(defaulAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            else {
                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
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
    private func updateContinueBtnState() {
        continueSignUp.isEnabled = isValidEmail && isConfPass && pass
    }
    
}
