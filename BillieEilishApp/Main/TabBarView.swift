//
//  TabBarView.swift
//  TabBarView
//
//  Created by Alexander Bonney on 8/1/21.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selection: Int
    @Namespace private var currentTab
    
    let tabs: [String] = ["amplifier", "music.quarternote.3", "music.note.house", "creditcard", "giftcard"]
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            ForEach(tabs.indices) { index in
                Button {
                    selection = index
                } label: {
                    Image(systemName: tabs[index]).foregroundColor(index == selection ? Color.white : Color("YellowBillie")).shadow(color: Color("YellowBillie"), radius: 10, x: 1, y: 1)
                }
            }
            Spacer()
        }
        .foregroundColor(Color("YellowBillie"))
        .padding(.top).padding(.bottom)
        .background(Color("background"))
        .font(.title)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(2))
    }
}



