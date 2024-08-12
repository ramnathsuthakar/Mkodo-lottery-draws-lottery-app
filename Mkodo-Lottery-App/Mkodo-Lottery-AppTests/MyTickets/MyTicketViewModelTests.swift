//
//  MyTicketViewModelTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class MyTicketViewModelTests: XCTestCase {
    
    func testTodayDateWithEdMMMyyyyFormat() {
        let viewModel = MyTicketViewModel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM yyyy"
        let todayDate = dateFormatter.string(from: Date())
        
        XCTAssertEqual(viewModel.date, todayDate)
    }
    
    func testLocalizedGreetingMessage() {
        let viewModel = MyTicketViewModel()
        let message = "my.tickets.greeting.message".localized
        XCTAssertEqual(viewModel.localizedGreetingMessage, message)
    }

    func testGenerateRandomNumbers() {
        let viewModel = MyTicketViewModel()
        viewModel.generateRandomNumbers()
        
        XCTAssertEqual(viewModel.numbers.count, 7, "There should be exactly 7 numbers generated.")
        
        let firstSixNumbers = Set(viewModel.numbers.prefix(6))
        XCTAssertEqual(firstSixNumbers.count, 6, "First 6 numbers should be unique")
        
        let lastNumber = viewModel.numbers.last!
        XCTAssert(lastNumber >= 1 && lastNumber <= 12, "Last number should be between 1 and 12")
    }
    
    func testBuildWinningNumber() {
        let draw = Draw(id: "draw-1", drawDate: "2023-05-15", number1: "2", number2: "16", number3: "23", number4: "44", number5: "47", number6: "52", bonusBall: "14", topPrize: 4000000000)
        let viewModel = MyTicketViewModel()
        let winningNumbers = viewModel.buildWinningNumber(draw: draw)
        
        XCTAssertEqual(winningNumbers.count, 7, "There should be exactly 7 numbers in the winning numbers array.")
        XCTAssertEqual(winningNumbers[0], 2)
        XCTAssertEqual(winningNumbers[1], 16)
        XCTAssertEqual(winningNumbers[2], 23)
        XCTAssertEqual(winningNumbers[3], 44)
        XCTAssertEqual(winningNumbers[4], 47)
        XCTAssertEqual(winningNumbers[5], 52)
        XCTAssertEqual(winningNumbers[6], 14)
    }
    
    func testBuildWinningNumberWithNilDraw() {
        let viewModel = MyTicketViewModel()
        let winningNumbers = viewModel.buildWinningNumber(draw: nil)
        
        XCTAssertTrue(winningNumbers.isEmpty, "Winning numbers should be empty when the draw is nil.")
    }
}


