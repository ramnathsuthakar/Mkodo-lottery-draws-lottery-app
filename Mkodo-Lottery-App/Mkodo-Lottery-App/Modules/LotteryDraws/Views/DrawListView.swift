//
//  DrawListView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct DrawListView: View {
    @ObservedObject var viewModel: DrawsViewModel
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.navigate(to: .home)
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                Spacer()
                Text(LocalizedStringKey("nav.greeting"))
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Image("userProfileImage")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(Array(viewModel.state.draws.enumerated()), id: \.element) { (index, draw) in
                        DrawItemView(draw: draw)
                            .onTapGesture {
                                // Need to add new screen to show the full view
                            }
                    }
                }
            }
        }
        .background(Color(.systemGray6))
        .navigationBarHidden(true)
        .task {
            viewModel.fetchDraws()
        }
        
    }
}




struct DrawListView_Previews: PreviewProvider {
    static var previews: some View {
        DrawListView(viewModel: DrawsViewModel(), coordinator: AppCoordinator())
    }
}
