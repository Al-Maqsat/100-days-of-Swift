//
//  SecondView.swift
//  DelegateTrain
//
//  Created by Maksat Baiserke on 16.09.2022.
//

import Foundation
import UIKit

protocol SelectionDelegate  {
    func didTappedSide(image: UIImage, name: String, color: UIColor)
}

class secondView: UIViewController{
    @IBOutlet var upperButton: UIButton!
    @IBOutlet var bottomButton: UIButton!
    @IBOutlet var sideS: UILabel!
    @IBOutlet var new: UILabel!
    var selectionDelegate: SelectionDelegate!
    
    override func viewDidLoad() {
        upperButton.imageView?.image = UIImage(named: "imperial")
        bottomButton.imageView?.image = UIImage(named: "rebel")
        
        upperButton.layer.cornerRadius = upperButton.frame.size.height/2
        bottomButton.layer.cornerRadius = bottomButton.frame.size.height/2
        // sideS.layer.cornerRadius = sideS.frame.size.height/2  this line
        // MARK: - Why I cannot set the corner radius ?
    }
    
    @IBAction func upperButtonTapped(_ sender: UIButton) {
        selectionDelegate.didTappedSide(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: .cyan)
        dismiss(animated: true)
    }
    
    @IBAction func BottomButtonTapped(_ sender: UIButton) {
        selectionDelegate.didTappedSide(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        dismiss(animated: true)
    }
    
}
