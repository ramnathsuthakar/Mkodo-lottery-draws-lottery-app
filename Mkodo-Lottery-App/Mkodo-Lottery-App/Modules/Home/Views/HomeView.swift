//
//  HomeView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text(LocalizedStringKey("nav.greeting"))
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
                Image("userProfileImage")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            
            TileView(title: "home.lottery.draws.title".localized, subtitle: "home.lottery.draws.description".localized, image: "lotteryDrawsImage") {
                coordinator.navigate(to: .drawDetails)
            }
            
            TileView(title: "home.my.tickets.title".localized, subtitle: "home.my.tickets.description".localized, image: "lotteryTicketImage") {
                coordinator.navigate(to: .myTickets)
            }

            Spacer()
        }
        .background(Color(.systemGray6))
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coordinator: AppCoordinator())
    }
}
