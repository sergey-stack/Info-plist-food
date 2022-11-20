//
//  StViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 4.10.22.
//

import Firebase
import UIKit

class StViewController: UIViewController {
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "Welcom")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.performSegue(withIdentifier: "alreadyLoggedI", sender: self)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.animation()
        }
    }

    func animation() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let xpostion = size - self.view.frame.width
            let ypostion = self.view.frame.height - size
            self.imageView.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
            self.imageView.alpha = 0
        }
    }
}
