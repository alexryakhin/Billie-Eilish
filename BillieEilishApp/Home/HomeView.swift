//
//  HomeView.swift
//  HomeView
//
//  Created by Alexander Bonney on 7/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(navigationTitle: "Billie Eilish")
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                //MARK: Content
                LazyVStack {
                    ForEach(vm.posts) { post in
                        VStack {
                            HomeItem(post: post).padding()
                            Divider().padding(.horizontal)
                        }
                    }
                }
            }
        }
        .background(Color("backgroungLight"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


