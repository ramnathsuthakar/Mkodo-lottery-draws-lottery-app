//
//  DrawDetailViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

class DrawDetailViewModel: DrawDetailViewModelProtocol {
    @Published var draw: Draw
    
    init(draw: Draw) {
        self.draw = draw
    }
}
