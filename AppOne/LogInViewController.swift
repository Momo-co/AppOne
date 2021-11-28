//
//  LogInViewController.swift
//  AppOne
//
//  Created by Suman Gurung on 05/11/2021.
//

import UIKit
import SwiftKeychainWrapper

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    var logInPresenter = LogInPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        
        logInPresenter.logInDelegate = self
        
        if let _userName = KeychainWrapper.standard.string(forKey: "userName") {
            userName.text = _userName
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInClick(_ sender: UIButton) {
        logInPresenter.logIn(userNameLabelText: userName.text, passwordLabelText: password.text) { value in
            self.logInToNextPage(isLogInSuccessful: value)
        }
    }
    
}
extension LogInViewController: LogInProtocol {
    func logInToNextPage(isLogInSuccessful: Bool) {
        if isLogInSuccessful {
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
