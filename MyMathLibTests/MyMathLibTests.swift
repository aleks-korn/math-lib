//
//  MyMathLibTests.swift
//  MyMathLibTests
//
//  Created by o.korniienko on 07.09.22.
//

import XCTest
@testable import MyMathLib

class MyMathLibTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPlus(){
        
      print("in test")
      let response =  MyMath.plus(number1: 3, number2: 4)
        print(response)
    }
    
    func testMinus(){
      let response =  MyMath.minus(number1: 3, number2: 4)
        print(response)
    }
    
    func testDividing(){
      let response =  MyMath.dividing(number1: 12, number2: 4)
        print(response)
    }
    
    func testMult(){
      let response =  MyMath.multiplication(number1: 3, number2: 4)
        print(response)
    }
    
    func testSend1(){
        let response = MyMath.sendFunction1(fcm_Token: "", os_Type: "", os_Version: "", device_Type: "", device_Name: "", sdk_Version: "", X_Push_Session_Id: "", X_Push_Auth_Token: "")
        print(response)
    }
    
    
    func testSome(){
        let response = MyMath.someFunc(text1: "Hello ", text2: "World!!!")
        print(response)
    }

}
