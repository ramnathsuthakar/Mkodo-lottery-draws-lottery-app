//
//  DrawsViewModelFailureTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class DrawsViewModelFailureTests: XCTestCase {
    
    func testFetchDrawsFailure() {
        let mockAPIManager = MockAPIManager(response: .failure)
        let viewModel = DrawsViewModel(apiManager: mockAPIManager)
        
        let expectation = self.expectation(description: "Fetch Draws Failure")
        viewModel.updatedState = {
            if case .error = viewModel.state {
                expectation.fulfill()
            }
        }
        
        viewModel.fetchDraws()
        waitForExpectations(timeout: 1, handler: nil)
    }
}
