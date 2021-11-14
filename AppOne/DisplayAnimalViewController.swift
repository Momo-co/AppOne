//
//  DisplayAnimalViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 08/11/2021.
//

import UIKit

class DisplayAnimalViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var animal:Animal?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: animal?.animalImage ?? "")
        nameLabel.text = animal?.name
        descriptionLabel.text = animal?.animalDescription

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
