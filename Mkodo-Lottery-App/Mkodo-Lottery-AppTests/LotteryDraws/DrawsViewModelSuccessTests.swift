//
//  DrawsViewModelSuccessTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class DrawsViewModelTests: XCTestCase {
    
    var mockAPIManager: MockAPIManager!
    var viewModel: DrawsViewModel!
    
    override func setUp() {
        mockAPIManager = MockAPIManager(response: .success)
        viewModel = DrawsViewModel(apiManager: mockAPIManager)
    }

    override func tearDown() {

    }

    func testFetchDraws() {
        let expectation = self.expectation(description: "Fetch Draws")
        viewModel.updatedState = { [weak self] in
            if case .loaded(let draws) = self?.viewModel.state {
                XCTAssertEqual(draws.count, 1)
                XCTAssertEqual(draws.first?.id, "draw-1")
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchDrawsId() {
        let expectation = self.expectation(description: "Fetch Draws Id")
        viewModel.updatedState = { [weak self] in
            if case .loaded(let draws) = self?.viewModel.state, let firstDraws = draws.first {
                XCTAssertEqual(firstDraws.id, "draw-1")
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchDrawsDrawDate() {
        let expectation = self.expectation(description: "Fetch Draws Date")
        viewModel.updatedState = { [weak self] in
            if case .loaded(let draws) = self?.viewModel.state, let firstDraws = draws.first {
                XCTAssertEqual(firstDraws.drawDate, "2023-05-15")
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchDrawsNumbers() {
        let expectation = self.expectation(description: "Fetch Draws Winning Numbers")
        viewModel.updatedState = { [weak self] in
            if case .loaded(let draws) = self?.viewModel.state, let firstDraws = draws.first {
                XCTAssertEqual(firstDraws.number1, "2")
                XCTAssertEqual(firstDraws.number2, "16")
                XCTAssertEqual(firstDraws.number3, "23")
                XCTAssertEqual(firstDraws.number4, "44")
                XCTAssertEqual(firstDraws.number5, "47")
                XCTAssertEqual(firstDraws.number6, "52")
                XCTAssertEqual(firstDraws.bonusBall, "14")
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchDrawsTopPrize() {
        let expectation = self.expectation(description: "Fetch Top Prize")
        viewModel.updatedState = { [weak self] in
            if case .loaded(let draws) = self?.viewModel.state, let firstDraws = draws.first {
                XCTAssertEqual(firstDraws.topPrize, 4000000000)
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
}



