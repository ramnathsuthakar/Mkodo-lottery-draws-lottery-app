//
//  APIManagerTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class APIManagerTests: XCTestCase {
    
    func testApiIntegrationFetchDrawsDraw1() {
        let apiManager = APIManager()
        let expectation = self.expectation(description: "Fetch Draws")
        
        apiManager.execute(Draw.drawDetails()) { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.draws.isEmpty)
                XCTAssertEqual(response.draws.first?.id, "draw-1")
                XCTAssertEqual(response.draws.first?.drawDate, "2023-05-15")
                XCTAssertEqual(response.draws.first?.number1, "5")
                XCTAssertEqual(response.draws.first?.number2, "16")
                XCTAssertEqual(response.draws.first?.number3, "23")
                XCTAssertEqual(response.draws.first?.number4, "44")
                XCTAssertEqual(response.draws.first?.number5, "47")
                XCTAssertEqual(response.draws.first?.number6, "52")
                XCTAssertEqual(response.draws.first?.bonusBall, "14")
                XCTAssertEqual(response.draws.first?.topPrize, 4000000000)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API request failed: \(error)")
            }
        }
    
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testApiIntegrationFetchDrawsDrawLast() {
        let apiManager = APIManager()
        let expectation = self.expectation(description: "Fetch Draws")
        
        apiManager.execute(Draw.drawDetails()) { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.draws.isEmpty)
                XCTAssertEqual(response.draws.last?.id, "draw-3")
                XCTAssertEqual(response.draws.last?.drawDate, "2023-05-29")
                XCTAssertEqual(response.draws.last?.number1, "34")
                XCTAssertEqual(response.draws.last?.number2, "21")
                XCTAssertEqual(response.draws.last?.number3, "4")
                XCTAssertEqual(response.draws.last?.number4, "58")
                XCTAssertEqual(response.draws.last?.number5, "1")
                XCTAssertEqual(response.draws.last?.number6, "15")
                XCTAssertEqual(response.draws.last?.bonusBall, "51")
                XCTAssertEqual(response.draws.last?.topPrize, 8000000000)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API request failed: \(error)")
            }
        }
    
        waitForExpectations(timeout: 5, handler: nil)
    }
}

