//
//  MyTicketView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct MyTicketView: View {
    @ObservedObject var coordinator: AppCoordinator
    @StateObject var viewModel: MyTicketViewModel
    @ObservedObject var viewModelDraws: DrawsViewModel
    
    var body: some View {
        VStack(spacing: 20) {
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
            
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text(LocalizedStringKey("my.tickets.lotto.title"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    HStack {
                        Text("7773-062403946-084779")
                        Spacer()
                        Image("barcodeSmall")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                    .font(.caption)
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(viewModel.localizedGreetingMessage) \(viewModel.date)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(LocalizedStringKey("my.tickets.your.number"))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    HStack(spacing: 8) {
                        ForEach(Array(viewModel.numbers.enumerated()), id: \.element) { index, number in
                            Text("\(number)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 40, height: 40)
                                .background(index == viewModel.numbers.count - 1 ? Color.blue : Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    
                    Divider()
                    
                    Text(LocalizedStringKey("my.tickets.winning.number"))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    HStack(spacing: 8) {
                        ForEach(Array(viewModel.buildWinningNumber(draw: viewModelDraws.state.draws.first).enumerated()), id: \.element) { index, number in
                            Text("\(number)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 40, height: 40)
                                .background(index == viewModel.numbers.count - 1 ? Color.blue : Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Image("barcodeBig")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding()
            Spacer()
        }
        .background(Color(.systemGray6))
        .navigationBarHidden(true)
        .onAppear {
            viewModel.generateRandomNumbers()
        }
        .task {
            viewModelDraws.fetchDraws()
        }
    }
}


struct MyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketView(coordinator: AppCoordinator(), viewModel: MyTicketViewModel(), viewModelDraws: DrawsViewModel())
    }
}
