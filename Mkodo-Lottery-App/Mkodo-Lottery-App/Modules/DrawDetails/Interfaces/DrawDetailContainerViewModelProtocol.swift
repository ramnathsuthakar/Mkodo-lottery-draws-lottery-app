//
//  DrawDetailContainerViewModelProtocol.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

protocol DrawDetailContainerViewModelProtocol: ObservableObject {
    
    // MARK: - Properies
    
    var draws: [Draw] { get }
    var selectedIndex: Int { get set }
}
