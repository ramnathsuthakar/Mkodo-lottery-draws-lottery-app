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
    }
    
    func navigate(to view: AppView) {
        currentView = view
    }
}
