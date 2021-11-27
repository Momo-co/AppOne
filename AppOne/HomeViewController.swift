//
//  HomeViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 04/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var animals:[Animal]?
    var selectedAnimal:Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animals = getAnimals()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func getAnimals() -> [Animal] {
        let a1 = Animal(name: "Tiger", animalDescription: "Animal Detail: This is a tiger and a dangerous animal. BEWARE!", animalImage: "Animal0")
        let a2 = Animal(name: "Crane", animalDescription: "Animal Detail: This is a crane and they are fast at flying. BEWARE of their speed!", animalImage: "Animal1")
        let a3 = Animal(name: "Viper", animalDescription: "Animal Detail: This is a viper and their bite can be poisonous. BEWARE of their venom!", animalImage: "Animal2")
        let a4 = Animal(name: "Monkey", animalDescription: "Animal Detail: This is a monkey and they can be agile. BEWARE of pranks!", animalImage: "Animal3")
        let a5 = Animal(name: "Mantis", animalDescription: "Animal Detail: This is a mantis and they are not easy to find. BEWARE of their presence!", animalImage: "Animal4")
        let a6 = Animal(name: "Panda", animalDescription: "Animal Detail: This is a panda and they are large. BEWARE of dangerous size!", animalImage: "Animal5")
        return [a1, a2, a3, a4, a5, a6]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayAnimalViewController = segue.destination as! DisplayAnimalViewController
        // displayAnimalViewController.animal = selectedAnimal
        displayAnimalViewController.animal = sender as? Animal
    }
    
    func parseConfig() -> Colour? {
        if let url = Bundle.main.url(forResource: "Colours", withExtension: "plist") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                let colour = try decoder.decode(Colour.self, from: data)
                return colour
            } catch {
                return nil
            }
                
        }
            return nil
    }
}
        

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalTableViewCell
        
        if let _animals = animals {
            let currentAnimal = _animals[indexPath.row]
            cell.animalImageView.image = UIImage(named: currentAnimal.animalImage ?? "")
            cell.animalName.text = currentAnimal.name
            cell.animalDetail.text = currentAnimal.animalDescription
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selectedAnimal = animals[indexPath.row]
        performSegue(withIdentifier: "goToAnimal", sender: animals?[indexPath.row])
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
}

