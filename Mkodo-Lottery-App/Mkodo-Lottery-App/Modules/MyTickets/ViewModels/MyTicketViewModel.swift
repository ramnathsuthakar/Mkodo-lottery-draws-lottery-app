//
//  MyTicketViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

final class MyTicketViewModel: MyTicketViewModelProtocol {

    // MARK: - Properies
    
    @Published var numbers: [Int] = []
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    var localizedGreetingMessage: String {
        "my.tickets.greeting.message".localized
    }
    
    // MARK: - Methods
    
    /*
     // Generate 6 unique random number between 1 to 59
     // Generate a bonus number between 1 to 12 and it can be duplicate from any of 6 number generated before.
     */
    func generateRandomNumbers() {
        var set = Set<Int>()
        while set.count < 6 {
            let number = Int.random(in: 1...59)
            set.insert(number)
        }
        var result = Array(set).sorted()
        
        let lastNumber = Int.random(in: 1...12)
        result.append(lastNumber)
        
        numbers = result
    }
    
    // Build a winning number from given Draw data
    func buildWinningNumber(draw: Draw?) -> [Int] {
        guard let draw = draw else { return [] }
        return [
            Int(draw.number1) ?? 0,
            Int(draw.number2) ?? 0,
            Int(draw.number3) ?? 0,
            Int(draw.number4) ?? 0,
            Int(draw.number5) ?? 0,
            Int(draw.number6) ?? 0,
            Int(draw.bonusBall) ?? 0
        ]
    }
}
