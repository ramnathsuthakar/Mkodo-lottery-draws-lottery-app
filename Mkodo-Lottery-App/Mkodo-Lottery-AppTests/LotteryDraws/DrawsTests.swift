//
//  DrawsTests.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import XCTest
@testable import Mkodo_Lottery_App

class DrawsTests: XCTestCase {
    
    func testDrawDecoding() {
        let json = """
        {
            "id": "draw-1",
            "drawDate": "2023-05-15",
            "number1": "5",
            "number2": "18",
            "number3": "22",
            "number4": "44",
            "number5": "47",
            "number6": "50",
            "bonus-ball": "14",
            "topPrize": 6000000000
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let draw = try decoder.decode(Draw.self, from: json)
            XCTAssertEqual(draw.id, "draw-1")
            XCTAssertEqual(draw.drawDate, "2023-05-15")
            XCTAssertEqual(draw.number1, "5")
            XCTAssertEqual(draw.number2, "18")
            XCTAssertEqual(draw.number3, "22")
            XCTAssertEqual(draw.number4, "44")
            XCTAssertEqual(draw.number5, "47")
            XCTAssertEqual(draw.number6, "50")
            XCTAssertEqual(draw.bonusBall, "14")
            XCTAssertEqual(draw.topPrize, 6000000000)
        } catch {
            XCTFail("Failed to decode Draw: \(error)")
        }
    }
}

