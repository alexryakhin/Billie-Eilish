//
//  NavigationBarView.swift
//  NavigationBarView
//
//  Created by Alexander Bonney on 8/1/21.
//

import SwiftUI

struct NavigationBarView: View {
    var navigationTitle: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(navigationTitle + " ")
                .font(.custom("Coronet", size: 40))
                .shadow(color: Color("YellowBillie"), radius: 10, x: 1, y: 1)
                .foregroundColor(.white)
                .padding(.bottom, -10)
            Spacer()
        }
        .background(Color("background"))
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(navigationTitle: "Billie Eilish")
            
    }
}
