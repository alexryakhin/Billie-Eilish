//
//  SongsListScreen.swift
//  Billie Eilish
//
//  Created by Alexander Ryakhin on 8/12/22.
//

import SwiftUI

struct SongsListScreen: View {
    var body: some View {
        NavigationView {
            List(0..<50) { id in
                Text("Song \(id)")
            }
            .navigationTitle("Songs")
        }
    }
}

struct SongsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SongsListScreen()
    }
}
