//
//  DrawDetailViewModelProtocol.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

protocol DrawDetailViewModelProtocol: ObservableObject {
    
    // MARK: - Properies
    
    var draw: Draw { get }
}
