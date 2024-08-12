//
//  MkodoLotteryAppApp.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

@main
struct MkodoLotteryAppApp: App {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch coordinator.currentView {
                case .home:
                    HomeView(coordinator: coordinator)
                case .drawDetails:
                    DrawListView(viewModel: DrawsViewModel(), coordinator: coordinator)
                }
            }
        }
    }
}
