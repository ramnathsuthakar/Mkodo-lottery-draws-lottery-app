//
//  DrawsViewModelProtocol.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

protocol DrawsViewModelProtocol: ObservableObject {
    
    // MARK: - Properies
    
    var state: DrawsViewModelState { get set }
    var updatedState: (() -> Void)? { get set }
    
    // MARK: - Methods
    
    func fetchDraws()
}
