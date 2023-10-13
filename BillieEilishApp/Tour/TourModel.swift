//
//  TourModel.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/10/21.
//

import Foundation

struct Tour: Codable {
    var name: String
    var concerts: [Concert]
}

struct Concert: Codable, Identifiable {
    var id: Int
    var name: String
    var date: Date
    var area: String
    var city: String
    var link: String?
    
    var isSoldOut: Bool {
        if link == nil {
            return true
        } else {
            return false
        }
    }
}
