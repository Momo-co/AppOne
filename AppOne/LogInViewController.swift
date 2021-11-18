//
//  LogInViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 05/11/2021.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self

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

@objc protocol ruleB: AnyObject {
    func getAge() -> Int
    @objc optional func getName() -> Int
}

class A {
    var name:String
    weak var delegate:ruleB?
    init(name:String, objectB:B){
        self.name = name
        self.delegate = objectB
    }
}

class B {
    var age:Int
    var objectA:A?
    init(age:Int){
        self.age = age
        objectA = A(name: "Andy", objectB: self)
    }
    func getAge() -> Int {
        return age
    }
}

extension B: ruleB {
    func doSomething()  {
        
    }
}
