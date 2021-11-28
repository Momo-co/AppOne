//
//  LogInPresenter.swift
//  AppOne
//
//  Created by Suman Gurung on 21/11/2021.
//

import Foundation
import SwiftKeychainWrapper

protocol LogInProtocol: AnyObject {
    func logInToNextPage(isLogInSuccessful: Bool)
}

class LogInPresenter {
    
    weak var logInDelegate: LogInProtocol?
    func logIn(userNameLabelText:String?, passwordLabelText:String?, logInClosure: ((Bool) -> Void)?) {
        
        let logInOutcome = logInValidation(userName: userNameLabelText, password: passwordLabelText)
        logInClosure?(logInOutcome)
        if logInOutcome {
            if let _userName = userNameLabelText {
                saveUserName(userName: _userName)
            }
            saveLogInSession()
        }
        //logInDelegate?.logInToNextPage(isLogInSuccessful: logInOutcome)
    }
    
    func saveLogInSession() {
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: "loginSuccess")
        userDefault.synchronize()
    }
    
    func saveUserName(userName:String) {
        KeychainWrapper.standard.set(userName, forKey: "userName")
    }
    
    func logInValidation(userName:String?, password:String?) -> Bool {
        guard let _userName = userName, let _password = password else {
            return false
        }
        if _userName == "abc", _password == "123" {
            return true
        }
        return false
    }
}
