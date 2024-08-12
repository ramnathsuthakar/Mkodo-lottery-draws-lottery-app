//
//  MyTicketViewModelProtocol.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

protocol MyTicketViewModelProtocol: ObservableObject {
    
    // MARK: - Properies
    
    var numbers: [Int] { get }
    var date: String { get }
    var localizedGreetingMessage: String { get }
    
    // MARK: - Methods
    
    func generateRandomNumbers()
    func buildWinningNumber(draw: Draw?) -> [Int]
}
