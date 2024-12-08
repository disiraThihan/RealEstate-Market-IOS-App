//
//  TabBarView.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selected = 0
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var initialSearchText = ""

    var body: some View {
        ZStack {
            Color.init(hex: "f9f9f9")
                .edgesIgnoringSafeArea(.all)
            TabView(selection: $selected) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(0)
                PropertyListView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Listing")
                    }.tag(1)
                MapView(initialSearchText: initialSearchText)
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Map")
                    }.tag(2)
                if appViewModel.isAuthenticated {
                    RealEstateListView()
                        .tabItem {
                            Image(systemName: "ellipsis.circle.fill")
                            Text("More")
                        }.tag(4)
                } else {
                    ProfileView()
                        .tabItem {
                            Image(systemName: "ellipsis.circle.fill")
                            Text("More")
                        }.tag(4)
                }
            }
        }
        .accentColor(Color.init(hex: "DB3022"))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(AppViewModel())
    }
}
