//
//  MusicView.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/3/21.
//

import SwiftUI
import MusicKit

struct MusicView: View {
    @StateObject var vm = MusicViewModel()
    @Environment(\.colorScheme) var colorScheme
    var navigationTitle = "My music"
    @State private var opacity: Double = 0
    @State private var oppositeOpasity: Double = 1
    
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                Image("BillieEilish").resizable().scaledToFill()
                    .padding(.top, 0)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: geo.frame(in: .global).minY > 0
                        ? geo.frame(in: .global).minY + (UIScreen.main.bounds.height / 3)
                        : UIScreen.main.bounds.height / 3
                    )
                    .offset(y: -geo.frame(in: .global).minY)
                    .opacity(oppositeOpasity)
                    .onChange(of: geo.frame(in: .global).minY) { _ in
                        let op = (-geo.frame(in: .global).minY - 70) / 100
                        if -geo.frame(in: .global).minY > 70 {
                            opacity = op
                            oppositeOpasity = 1 - op
                        } else {
                            opacity = 0
                            oppositeOpasity = 1
                        }
                    }
            }
            
            VStack {
                
                //MARK: Content
                Text(vm.albums.first?.artistName ?? "Artist name").font(.title).bold()
                if vm.albums.first != nil {
                    AlbumView(album: vm.albums.first!)
                }
            }.background(Color("backgroungLight")).padding(.top, 270)
            
        }.background(Color("backgroungLight"))
        .overlay (
            VStack(spacing: 0) {
                NavigationBarView(navigationTitle: "My music")
                Divider()
                Spacer()
            }
            .opacity(opacity)
        )
        .onAppear {
            Task {
                await vm.getData()
            }
        }
    }
    
    
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}


