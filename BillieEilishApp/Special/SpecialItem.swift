//
//  SpecialItem.swift
//  SpecialItem
//
//  Created by Alexander Bonney on 8/1/21.
//

import Foundation

struct SpecialItem: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var shortDesc: String
    var description: String
    var detailImages: [String]
    var url: String
    var buttonLabel: String
    
    //may be something more
    
    
    //example
    static let example = SpecialViewModel().items.first!
}
