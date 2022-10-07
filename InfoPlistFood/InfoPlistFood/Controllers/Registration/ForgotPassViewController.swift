//
//  ForgotPassViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 3.10.22.
//

import UIKit
import FirebaseAuth

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func forgotPassAction(_ sender: UIButton) {
        let email = emailTF.text!
        if(!email.isEmpty){
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if error == nil {
                    self.navigationController?.popToRootViewController(animated: true)
                   
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

}
}
