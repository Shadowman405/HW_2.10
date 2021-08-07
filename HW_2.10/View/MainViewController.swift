//
//  ViewController.swift
//  HW_2.10
//
//  Created by Maxim Mitin on 7.08.21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradientColor(color: .blue)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "random" {
            let randomPicVC = segue.destination as! RandomPictureViewController
            randomPicVC.fetchRandomImage()
        }
    }
}

// MARK: - Adding gradient to main biew background
extension UIView {
    func addGradientColor(color: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, color.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
