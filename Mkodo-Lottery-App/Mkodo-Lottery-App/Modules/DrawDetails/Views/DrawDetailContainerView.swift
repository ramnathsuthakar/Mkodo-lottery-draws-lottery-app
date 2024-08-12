//
//  DrawDetailContainerView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct DrawDetailContainerView<ViewModel: DrawDetailContainerViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        TabView(selection: $viewModel.selectedIndex) {
            ForEach(0..<viewModel.draws.count, id: \.self) { index in
                DrawDetailView(viewModel: DrawDetailViewModel(draw: viewModel.draws[index]) as DrawDetailViewModel, coordinator: coordinator)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
