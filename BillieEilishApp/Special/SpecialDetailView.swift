//
//  SpecialDetailView.swift
//  SpecialDetailView
//
//  Created by Alexander Bonney on 8/1/21.
//

import SwiftUI

struct SpecialDetailView: View {
    var item: SpecialItem
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image(item.image).resizable().scaledToFit()
            
            Text(item.description).padding(.horizontal).font(Font.custom("Adelle", size: 18))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(item.detailImages, id: \.self) { image in
                        Image(image).resizable().scaledToFill().frame(width: 270, height: 200).clipped()
                    }
                }
            }.padding(.vertical)
            
            Link(destination: URL(string: item.url)!) {
                Text(item.buttonLabel).padding().padding(.horizontal, 20).background(Color("itemBackground")).cornerRadius(10).padding(.bottom, 30).foregroundColor(.white)
            }.shadow(radius: 10)
        }
//        .ignoresSafeArea()
            .background(Color("backgroungLight"))
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        
    }
    
}


//struct SpecialDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialDetailView(item: SpecialItem.example)
//    }
//}
