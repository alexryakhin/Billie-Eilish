//
//  SpecialViewModel.swift
//  SpecialViewModel
//
//  Created by Alexander Bonney on 8/1/21.
//

import Foundation

class SpecialViewModel: ObservableObject {
    
    @Published var items: [SpecialItem] = [
    SpecialItem(
        image: "bookCover",
        name: "Book",
        shortDesc: "Legendary recording artist Billie Eilish shares an intimate inside look at her life and career — both on and off the stage — in this stunning, photo-filled book.",
        description: "Legendary recording artist Billie Eilish shares an intimate inside look at her life and career—both on and off the stage—in this stunning, photo-filled book.\n\nBillie Eilish is a 21st century global pop-phenomenon. Uncompromising and unapologetic, between her record-breaking, award-winning music and artistry, it's no surprise that she has become one of the biggest and most loved artists of her generation.\n\nNow in her first book -- a stunning visual narrative journey through her life -- Billie is ready to share more with her devoted audience for the first time, including hundreds of never-before-seen photos. This gorgeous book will capture the essence of Billie inside and out, offering readers personal glimpses into her childhood, her life on tour, and more. It will be a must-have for every fan.\n\nPublished simultaneously with the book, Hachette will release a standalone audiobook of exclusive, unique content in which Billie reflects on her life. Including never-before-told stories and recollections from her personal life and career, from the early years to her breakout success and including memories shared by her parents, this is an audiobook like no other – providing a truly intimate window into her journey, in Billie’s own words.",
        detailImages: ["fromBook1", "fromBook2", "fromBook3", "fromBook4"],
        url: "https://smarturl.it/byBillieUS",
        buttonLabel: "Buy"),
    
    SpecialItem(
        image: "documentaryPosterSquare2",
        name: "Billie Eilish: The World's a Little Blurry",
        shortDesc: "An intimate look at the singer-songwriter's journey, navigating life on the road, on stage, and at home, while creating her debut album.",
        description: "Taking a deeply personal look at the extraordinary teenager, Billie Eilish, and following her journey on the road, on stage, and at home with her family, as the writing and recording of her debut album changes her life.",
        detailImages: ["documentary1", "documentary2", "documentary3", "documentary4"],
        url: "http://apple.co/-BillieEilishDoc-",
        buttonLabel: "Watch on Apple TV")
    
    ]
    
    
    
    
}
