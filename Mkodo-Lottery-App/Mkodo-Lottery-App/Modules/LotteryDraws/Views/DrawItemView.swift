//
//  DrawItemView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct DrawItemView: View {
    let draw: Draw
    
    var body: some View {
        VStack {
            HStack {
                Image("lotteryDrawsImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 90)
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("DRAW - \(String(draw.id.split(separator: "-").last!))") // Convert Substring to String
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(draw.drawDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            HStack(spacing: 4) { // Fixed spacing between circles
                ForEach([draw.number1, draw.number2, draw.number3, draw.number4, draw.number5, draw.number6, draw.bonusBall], id: \.self) { number in
                    Text(number)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .frame(width: 40, height: 40) // Fixed size for each circle
                        .background(number == draw.bonusBall ? Color.blue : Color.orange)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            Text("Top Prize: £\(draw.topPrize)")
                .font(.headline)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}


struct DrawItemView_Previews: PreviewProvider {
    static var previews: some View {
        let draw = Draw(id: "draw-1",
                     drawDate: "2023-05-15",
                     number1: "2",
                     number2: "16",
                     number3: "23",
                     number4: "44",
                     number5: "47",
                     number6: "52",
                     bonusBall: "14",
                     topPrize: 4000000000)
        DrawItemView(draw: draw)
    }
}
