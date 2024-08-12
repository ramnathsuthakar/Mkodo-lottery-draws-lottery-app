//
//  DrawListView.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import SwiftUI

struct DrawListView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DrawListView_Previews: PreviewProvider {
    static var previews: some View {
        DrawListView(coordinator: AppCoordinator())
    }
}
