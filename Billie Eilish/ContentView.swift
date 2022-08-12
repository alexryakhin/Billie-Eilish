//
//  ContentView.swift
//  Billie Eilish
//
//  Created by Alexander Ryakhin on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SongsListScreen()
                .tabItem {
                    Label {
                        Text("Songs")
                    } icon: {
                        Image(systemName: "music.note.list")
                    }
                }
            
            AboutScreen()
                .tabItem {
                    Label {
                        Text("About")
                    } icon: {
                        Image(systemName: "info.circle")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
