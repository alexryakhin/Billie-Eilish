//
//  SpecialView.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/3/21.
//

import SwiftUI

struct SpecialView: View {
    @ObservedObject var vm = SpecialViewModel()
    @State var currentItem: SpecialItem?
    @State var showingDetails: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationBarView(navigationTitle: "Special ")
                Divider()
                ScrollView(.vertical, showsIndicators: false) {
                    //MARK: Content
                    ForEach(vm.items) { item in
                        NavigationLink {
                            SpecialDetailView(item: item)
                        } label: {
                            CellView(item: item)
                                .padding()
                            
                        }
                        Divider()
                    }
                }
            }
            .background(Color("backgroungLight"))
            .navigationTitle("Special")
            .navigationBarHidden(true)
        }
    }
}

struct SpecialView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialView()
    }
}

struct CellView: View {
    var item: SpecialItem
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .shadow(radius: 10)
                .padding(5)
            Text(item.shortDesc)
                .font(Font.custom("Adelle", size: 20))
        }.padding()
        
    }
}
