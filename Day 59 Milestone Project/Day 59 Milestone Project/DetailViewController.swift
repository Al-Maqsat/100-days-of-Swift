//
//  DetailViewController.swift
//  Day 59 Milestone Project
//
//  Created by Maksat Baiserke on 15.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var nameOfTheCountry: UILabel!
    @IBOutlet var population: UILabel!
    @IBOutlet var region: UILabel!
    @IBOutlet var subregion: UILabel!
    @IBOutlet var demonym: UILabel!
    @IBOutlet var area: UILabel!
    
    
    
    @IBOutlet var capitalCity: UILabel!
    
    var nameS: String?
    var populationS: Int?
    var regionS: String?
    var subregionS: String?
    var demonymS: String?
    var areaS: Double?
    var capitalCityS: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOfTheCountry.text = nameS
        population.text = "\(String(describing: populationS!))"
        region.text = regionS
        subregion.text = subregionS
        demonym.text = demonymS
        area.text = "\(String(describing: areaS!)) [m^2]"
//        currency.text = currencyS
        capitalCity.text = capitalCityS
        

    }

}
