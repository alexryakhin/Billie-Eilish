//
//  MainView.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/3/21.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 2
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selection) {
                TourView().tag(0)
                MusicView().tag(1)
                HomeView().tag(2)
                StoreView().tag(3)
                SpecialView().tag(4)
            }
            .ignoresSafeArea()
            Divider()
            TabBarView(selection: $selection)
            
        }.background(Color("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
