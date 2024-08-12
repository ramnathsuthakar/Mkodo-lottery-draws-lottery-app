//
//  MyTicketViewModelProtocol.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

protocol MyTicketViewModelProtocol: ObservableObject {
    var numbers: [Int] { get }
    var date: String { get }
    
    func localizedGreetingMessage() -> String
}
