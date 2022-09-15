//
//  ViewController.swift
//  Day 59 Milestone Project
//
//  Created by Maksat Baiserke on 15.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://restcountries.com/v2/all"
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonInfo = try? decoder.decode([Country].self, from: json){
            countries = jsonInfo
//            tableView.reloadData()
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newViewController") as? DetailViewController else {
            print("Cannot push the view Controller")
            return
        }
        
        vc.nameS = countries[indexPath.row].name
        vc.populationS = countries[indexPath.row].population
        vc.capitalCityS = countries[indexPath.row].capital
        vc.areaS = countries[indexPath.row].area
        vc.regionS = countries[indexPath.row].region
        vc.demonymS = countries[indexPath.row].demonym
        vc.subregionS = countries[indexPath.row].subregion
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

