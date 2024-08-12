//
//  DrawDetailContainerViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

class DrawDetailContainerViewModel: DrawDetailContainerViewModelProtocol {
    @Published var draws: [Draw]
    @Published var selectedIndex: Int
    
    init(draws: [Draw], selectedIndex: Int) {
        self.draws = draws
        self.selectedIndex = selectedIndex
    }
}
