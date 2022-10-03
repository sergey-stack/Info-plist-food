//
//  StartViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
          self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
       }
//        Auth.auth().addStateDidChangeListener { [weak self] _ , user in
//                    guard let _ = user else {
//                        return
//                    }
//                    self?.performSegue(withIdentifier: "goToMain", sender: nil)
//                }
//
   }
    
    override func viewDidAppear(_ animated: Bool){
     super.viewDidAppear(animated)
     if Auth.auth().currentUser != nil {
       self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("I will appear")
    }
}
        
       
    
//    override func viewDidAppear(_ animated: Bool){
//     super.viewDidAppear(animated)
//     if Auth.auth().currentUser != nil {
//       self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
//    }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


