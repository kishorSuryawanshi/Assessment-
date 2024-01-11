//
//  DemoAppUnitTests.swift
//  DemoAppTests
//
//  Created by Kishor on 11/01/24.
//

import XCTest
@testable import DemoApp

final class DemoAppUnitTests: XCTestCase {

    func testViewControllerInstance() {
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let vc = stb.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        XCTAssertNotNil(vc)
    }

    func testShowUserVCInstance() {
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let vc = stb.instantiateViewController(withIdentifier: "ShowUserVC") as? ShowUserVC
        
        XCTAssertNotNil(vc)
    }

}
