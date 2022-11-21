//
//  StartViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import Firebase
import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

       if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
       }
    }
}
