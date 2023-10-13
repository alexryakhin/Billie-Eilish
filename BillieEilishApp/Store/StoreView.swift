//
//  StoreView.swift
//  StoreView
//
//  Created by Alexander Bonney on 7/31/21.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(navigationTitle: "Store")
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                
                
                //MARK: Content
                
                
            }
        }
        .background(Color("backgroungLight"))
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
