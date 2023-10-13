//
//  TourView.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/10/21.
//

import SwiftUI

struct TourView: View {
    
    let tour: Tour = Bundle.main.decode("billie_tour.json")
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(navigationTitle: "Happier Than Ever Tour")
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: Content
                
                VStack {
                    ForEach(tour.concerts) { concert in
                        HStack {
                            //date
                            VStack {
                                Text(concert.date.formatted(.dateTime.month())).font(.custom("Adelle", size: 18))
                                Text(concert.date.formatted(.dateTime.day())).font(.custom("Adelle", size: 18))
                            }
                            .frame(width: 50, height: 50)
                            .background(Color("background").opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            
                            Spacer()
                            VStack {
                                Text(concert.name).font(.custom("Adelle", size: 16)).lineLimit(1)
                                Text("\(concert.city), \(concert.area)")
                                    .font(.custom("Adelle", size: 14))
                            }
                            Spacer()
                            if concert.isSoldOut {
                                Image(systemName: "creditcard.trianglebadge.exclamationmark")
                                    .foregroundColor(.secondary)
                            } else {
                                Link(destination: URL(string: concert.link!)!) {
                                    Image(systemName: "creditcard.fill")
                                }
                            }
                        }
                    }
                }.padding()
            }
        }
        .background(Color("backgroungLight"))
    }
}

struct TourView_Previews: PreviewProvider {
    static var previews: some View {
        TourView()
    }
}
