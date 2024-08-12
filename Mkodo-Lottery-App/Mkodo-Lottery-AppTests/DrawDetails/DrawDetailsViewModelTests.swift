//
//  DrawDetailsViewModelTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class DrawDetailsViewModelTests: XCTestCase {

    func testDrawDetailsViewModelInitialization() {
        let draw = Draw(id: "draw-1", drawDate: "2023-05-15", number1: "2", number2: "16", number3: "23", number4: "44", number5: "47", number6: "52", bonusBall: "14", topPrize: 4000000000)
        let viewModel = DrawDetailViewModel(draw: draw)
        
        XCTAssertEqual(viewModel.draw.id, "draw-1")
        XCTAssertEqual(viewModel.draw.drawDate, "2023-05-15")
        XCTAssertEqual(viewModel.draw.number1, "2")
        XCTAssertEqual(viewModel.draw.number2, "16")
        XCTAssertEqual(viewModel.draw.number3, "23")
        XCTAssertEqual(viewModel.draw.number4, "44")
        XCTAssertEqual(viewModel.draw.number5, "47")
        XCTAssertEqual(viewModel.draw.number6, "52")
        XCTAssertEqual(viewModel.draw.bonusBall, "14")
        XCTAssertEqual(viewModel.draw.topPrize, 4000000000)
    }
}
