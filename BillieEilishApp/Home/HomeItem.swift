//
//  HomeItem.swift
//  HomeItem
//
//  Created by Alexander Bonney on 7/31/21.
//

import SwiftUI

struct HomeItem: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(post.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(post.text).font(.custom("Adelle", size: 17)).lineLimit(5)
                Text(post.creator.rawValue).font(.custom("Adelle", size: 10)).foregroundColor(.secondary)
            }
        }.shadow(color: Color("YellowBillie"), radius: 10)
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            HomeItem(post: Post(creator: .billie, image: "post1", text: "don’t wanna treat you welllllllll🙃🙃"))
        }
    }
}
