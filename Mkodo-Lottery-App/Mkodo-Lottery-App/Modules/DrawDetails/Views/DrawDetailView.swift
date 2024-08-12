//
//  DrawDetailView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct DrawDetailView<ViewModel: DrawDetailViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var coordinator: AppCoordinator

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
                Text("nav.greeting".localized)
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
                Image("lotteryBgImage")
                    .resizable()
                    .scaledToFit()

                Text("\("draw.details.draw".localized) - \(String(viewModel.draw.id.split(separator: "-").last!))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)

                Text(viewModel.draw.drawDate)
                    .font(.title3)
                    .fontWeight(.semibold)

                HStack(spacing: 8) {
                    ForEach([viewModel.draw.number1,
                             viewModel.draw.number2,
                             viewModel.draw.number3,
                             viewModel.draw.number4,
                             viewModel.draw.number5,
                             viewModel.draw.number6,
                             viewModel.draw.bonusBall],
                            id: \.self) { number in
                        Text(number)
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(width: 40, height: 40)
                            .background(number == viewModel.draw.bonusBall ? Color.blue : Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }

                Text("draw.details.top.prize".localized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.red)

                Text("£\(viewModel.draw.topPrize)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.vertical)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal)
            Spacer()
        }
        .background(Color(.systemGray6))
        .navigationBarHidden(true)
    }
}
