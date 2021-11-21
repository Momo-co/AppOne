//
//  LogInViewControllerTests.swift
//  AppOneTests
//
//  Created by Suman Gurung on 21/11/2021.
//

import XCTest
@testable import AppOne

class LogInViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testlogInCorrectCredentials() {
        // Given
        let logInPresenter = LogInPresenter()
        let userName = "abc"
        let password = "123"
        // Then
        let expectedOutput = true
        let actualOutput = logInPresenter.logInValidation(userName: userName, password: password)
        // When
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testlogInCorrectUserNameWrongPassword() {
        // Given
        let logInPresenter = LogInPresenter()
        let userName = "abc"
        let password = "13"
        // Then
        let expectedOutput = false
        let actualOutput = logInPresenter.logInValidation(userName: userName, password: password)
        // When
        XCTAssertEqual(expectedOutput, actualOutput)
    }

}
