//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Kishor on 11/01/24.
//

import XCTest
@testable import DemoApp

final class DemoAppTests: XCTestCase {

    func test_uploadData_WithValidData() {
        
        let expectations = self.expectation(description: "test upload data")
        
        let postParam = RequestModel(appKey: "GMMS", tokenId: "ASD45FG67HJ89KL", userName: "Palak", projectId: "E.0010402.1")
        
        APIHelper.shared.uploadData(postParam: postParam) { response in
            
            XCTAssertEqual(response?.statusCode, 200)
            XCTAssertEqual(response?.message, "Access token is valid")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_uploadData_WithInvalidToken() {
        let postParam = RequestModel(appKey: "GMMS", tokenId: "UHGF6543TGBJ98Y", userName: "Palak", projectId: "E.0010402.1")
        let expectations = self.expectation(description: "test upload data")
        
        APIHelper.shared.uploadData(postParam: postParam) { response in
            XCTAssertEqual(response?.statusCode, 401)
            XCTAssertNil(response?.data)
            XCTAssertEqual(response?.message, "check the passed token.")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_uploadData_WithEmptyToken() {
        let postParam = RequestModel(appKey: "GMMS", tokenId: "", userName: "Palak", projectId: "E.0010402.1")
        let expectations = self.expectation(description: "test upload data")
        
        APIHelper.shared.uploadData(postParam: postParam) { response in
            XCTAssertEqual(response?.statusCode, 401)
            XCTAssertNil(response?.data)
            XCTAssertEqual(response?.message, "check the passed token.")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_uploadData_WithEmptyUserNameAndProject() {
        let postParam = RequestModel(appKey: "GMMS", tokenId: "ASD45FG67HJ89KL", userName: "", projectId: "")
        let expectations = self.expectation(description: "test upload data")
        
        APIHelper.shared.uploadData(postParam: postParam) { response in
            XCTAssertEqual(response?.statusCode, 200)
            XCTAssertNotNil(response?.data)
            XCTAssertEqual(response?.message, "Access token is valid")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_uploadData_WithOnlyToken() {
        let postParam = RequestModel(appKey: "", tokenId: "ASD45FG67HJ89KL", userName: "", projectId: "")
        let expectations = self.expectation(description: "test upload data")
        
        APIHelper.shared.uploadData(postParam: postParam) { response in
            XCTAssertEqual(response?.statusCode, 200)
            XCTAssertNotNil(response?.data)
            XCTAssertEqual(response?.message, "Access token is valid")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
