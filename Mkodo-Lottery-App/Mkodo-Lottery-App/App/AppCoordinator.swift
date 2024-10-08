//
//  AppCoordinator.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

class AppCoordinator: ObservableObject {
    @Published var currentView: AppView = .home
    
    enum AppView {
        case home
        case drawDetails
        case myTickets
        case drawDetailContainer(draws: [Draw], selectedIndex: Int)
    }
    
    func navigate(to view: AppView) {
        currentView = view
    }
}
