//
//  DrawsViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

enum DrawsViewModelState {
    case loading
    case loaded([Draw])
    case error
    
    var draws: [Draw] {
        switch self {
        case .loaded(let draws):
            return draws
        case .loading, .error:
            return []
        }
    }
}

final class DrawsViewModel: DrawsViewModelProtocol {

    init() {
        self.state = .loading
    }

    var updatedState: (() -> Void)?

    @Published var state: DrawsViewModelState {
        didSet {
            self.updatedState?()
        }
    }

    func fetchDraws() {
        
        // Tempory Data
        let drawOne = Draw(id: "draw-1",
                     drawDate: "2023-05-15",
                     number1: "2",
                     number2: "16",
                     number3: "23",
                     number4: "44",
                     number5: "47",
                     number6: "52",
                     bonusBall: "14",
                     topPrize: 4000000000)
        
        let drawTwo = Draw(id: "draw-2",
                     drawDate: "2023-05-22",
                     number1: "5",
                     number2: "45",
                     number3: "51",
                     number4: "32",
                     number5: "24",
                     number6: "18",
                     bonusBall: "28",
                     topPrize: 6000000000)
        
        state = .loaded([drawOne, drawTwo])

    }
}


