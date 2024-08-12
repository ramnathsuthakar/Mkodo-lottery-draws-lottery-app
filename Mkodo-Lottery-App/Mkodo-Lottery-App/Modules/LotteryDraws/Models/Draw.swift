//
//  Draw.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

struct Draw: Identifiable, Codable, Hashable {
    let id: String
    let drawDate: String
    let number1: String
    let number2: String
    let number3: String
    let number4: String
    let number5: String
    let number6: String
    let bonusBall: String
    let topPrize: Int

    enum CodingKeys: String, CodingKey {
        case id
        case drawDate
        case number1
        case number2
        case number3
        case number4
        case number5
        case number6
        case bonusBall = "bonus-ball"
        case topPrize
    }
}

struct DrawsResponse: Codable {
    let draws: [Draw]
}

// MARK: - Extension (Request)

extension Draw {
    static func drawDetails() -> Request<Draws<Draw>> {
        return Request(method: .get, path: "/mock/v2/lotteryDraws")
    }
}

