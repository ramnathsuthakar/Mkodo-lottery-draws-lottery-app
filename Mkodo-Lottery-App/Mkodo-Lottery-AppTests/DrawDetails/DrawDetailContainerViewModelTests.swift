//
//  DrawDetailContainerViewModelTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class DrawDetailContainerViewModelTests: XCTestCase {
    var draw1: Draw!
    var draw2: Draw!

    override func setUp() {
        draw1 = Draw(id: "draw-1",
                     drawDate: "2023-05-15",
                     number1: "2",
                     number2: "16",
                     number3: "23",
                     number4: "44",
                     number5: "47",
                     number6: "52",
                     bonusBall: "14",
                     topPrize: 4000000000)
        
        draw2 = Draw(id: "draw-2",
                     drawDate: "2023-05-22",
                     number1: "5",
                     number2: "45",
                     number3: "51",
                     number4: "32",
                     number5: "24",
                     number6: "18",
                     bonusBall: "28",
                     topPrize: 6000000000)
    }

    override func tearDown() {
        draw1 = nil
        draw2 = nil
    }

    func testDrawDetailContainerViewModelInitialization() {
        guard let draw1 = draw1, let draw2 = draw2 else {
            XCTFail("testDrawDetailContainerViewModelInitialization Test failed")
            return
        }
        let draws = [draw1, draw2]
        
        let viewModel = DrawDetailContainerViewModel(draws: draws, selectedIndex: 0)
        
        XCTAssertEqual(viewModel.draws.count, 2)
        XCTAssertEqual(viewModel.selectedIndex, 0)
        XCTAssertEqual(viewModel.draws[0].id, "draw-1")
        XCTAssertEqual(viewModel.draws[1].id, "draw-2")
    }
    
    func testDrawDetailContainerViewModelIndexChange() {
        guard let draw1 = draw1, let draw2 = draw2 else {
            XCTFail("testDrawDetailContainerViewModelInitialization Test failed")
            return
        }
        let draws = [draw1, draw2]
        
        let viewModel = DrawDetailContainerViewModel(draws: draws, selectedIndex: 0)
        
        viewModel.selectedIndex = 1
        XCTAssertEqual(viewModel.selectedIndex, 1)
        XCTAssertEqual(viewModel.draws[viewModel.selectedIndex].id, "draw-2")
    }

}
