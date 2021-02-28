//
//  CoffeePlacesViewModelTests.swift
//  demoProjTests
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import XCTest
@testable import demoProj

class CoffeePlacesViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchVanues() throws {
        let viewModel = CoffeePlacesViewModel()
        viewModel.fetchVanues(success: { (vanues) in
            XCTAssertTrue((vanues.count > 0), "Fetching of the vanues and it's details failed.")
        }, failure: { (error) in
            
        })
    }
    
    func testFetchVanueDetails() throws {
        
    }
    
}
