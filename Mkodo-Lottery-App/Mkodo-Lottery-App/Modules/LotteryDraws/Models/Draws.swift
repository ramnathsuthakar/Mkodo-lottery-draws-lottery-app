//
//  Draws.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

struct Draws<T: Decodable>: Decodable {

    let draws: [T]
    
    enum CodingKeys: String, CodingKey {
        case draws
    }
    
}
