//
//  ViewController.swift
//  DelegateTrain
//
//  Created by Maksat Baiserke on 16.09.2022.
//

import UIKit

class ViewController: UIViewController, SelectionDelegate {
    @IBOutlet var Choose: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var starWarsLogo: UIImageView!
    @IBOutlet var nameOfTheLeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        nameOfTheLeader.isHidden = true

        starWarsLogo.image = UIImage(named: "logo")
        starWarsLogo.isHidden = false
        
        
        Choose.layer.cornerRadius = Choose.frame.size.height/2
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        nameOfTheLeader.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        guard let sv = storyboard?.instantiateViewController(withIdentifier: "chosen") as? secondView else {return}
        sv.selectionDelegate = self
        present(sv, animated: true)
    }
    
    func didTappedSide(image: UIImage, name: String, color: UIColor) {
        imageView.image = image
        nameOfTheLeader.text = name
        imageView.backgroundColor = color
        starWarsLogo.isHidden = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.imageView.isHidden = false
            self.nameOfTheLeader.isHidden = false
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.nameOfTheLeader.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {
            finished in
        })
    }
}

