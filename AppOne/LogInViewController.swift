//
//  LogInViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 05/11/2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func logInClick(_ sender: UIButton) {
        if let _userName = userName.text, let _password  = password.text, _userName == "abc", _password == "123" {
            performSegue(withIdentifier: "goToTableView", sender: nil)
        } else {
            print("Please enter both your username and password")
        }
    }
}
