//
//  RandomPictureViewController.swift
//  HW_2.10
//
//  Created by Maxim Mitin on 7.08.21.
//

import UIKit

class RandomPictureViewController: UIViewController {
    @IBOutlet weak var randomPicture: UIImageView!
    
    private let randomURL = "https://dog.ceo/api/breeds/image/random"
    private var photo: RandomPhoto?

// MARK: - Get data from API
    func fetchRandomImage() {
        guard let url = URL(string: randomURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            guard error == nil else {return}
            
            do {
                let photo = try JSONDecoder().decode(RandomPhoto.self, from: data)
                self.configure(photo: photo)
                print(self.photo?.message ?? "")
            } catch let error {
                print(error)
            }
        }.resume()
    }

// MARK: - Configure image from url adress
    
    func configure(photo: RandomPhoto) {
        guard let url = URL(string: photo.message ?? "") else {return}
        guard let imageData = try? Data(contentsOf: url) else {return}
        DispatchQueue.main.async {
            self.randomPicture.image = UIImage(data: imageData)
        }
    }
}


