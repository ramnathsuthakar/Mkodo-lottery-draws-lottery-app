//
//  MyTicketViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

final class MyTicketViewModel: MyTicketViewModelProtocol {

    @Published var numbers: [Int] = []
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    func localizedGreetingMessage() -> String {
        "my.tickets.greeting.message".localized
    }
}
