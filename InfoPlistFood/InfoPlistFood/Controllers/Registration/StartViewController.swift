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

/*
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
 }
 */
