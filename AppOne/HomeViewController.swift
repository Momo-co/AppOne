//
//  HomeViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 04/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalTableViewCell
        
        cell.animalImageView.image = UIImage(named: "Animal\(indexPath.row)")
        cell.animalName.text = "Animal \(indexPath.row)"
        
        var nameOfAnimal:String = ""
        
        if indexPath.row == 0 {
            nameOfAnimal = "tiger"
        } else if indexPath.row == 1 {
            nameOfAnimal = "crane"
        } else if indexPath.row == 2 {
            nameOfAnimal = "viper"
        } else if indexPath.row == 3 {
            nameOfAnimal = "monkey"
        } else if indexPath.row == 4 {
            nameOfAnimal = "mantis"
        } else if indexPath.row == 5 {
            nameOfAnimal = "panda"
        } else {
            nameOfAnimal = "panda"
        }
        
        cell.animalDetail.text = "Animal details: This is a \(nameOfAnimal)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "DisplayAnimalViewController", sender: nil)
    }
}
