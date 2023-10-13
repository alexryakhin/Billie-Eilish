//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Alexander Bonney on 7/31/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var posts: Array<Post> = [
        Post(creator: .billie, image: "HappierThanEverCover", text: "“Happier Than Ever” my sophomore album is finally out. i can’t even process it. this was the most fulfilling most satisfying and profound experience i’ve ever had with my music. finneas and i were just on cloud 9 making this album i feel.. i love every song on this project so so much it literally scares me thinking about putting it out into the world for anyone to listen to. i feel like crying. i grew so much in the process of making this album and experienced so much self realization and self reflection. i wish i could go back and make this album all over again because it was some of the best nights in my life. i love you @finneas thank you for being you. i couldn’t ask for a better brother and collaborator, you are my whole world and i couldn’t do any of this without you. anyway i’m so excited and nervous and blaaah… please take care of this project, it means the world to me. 🤍 I CANT BELIEVE ITTTT"),
        Post(creator: .billie, image: "post2", text: "“HAPPIER THAN EVER” COMES OUT TONIGHT OMGHSKAHFHJSBDGCHKDBAHDKGUSKAHDHSKANDGHCKSBAGXKSKGSCJSJSGFGDJDKSHSFXUKSHXGXJSKSHGDJDKSHDGFIJSGXHSK"),
        Post(creator: .billie, image: "post3", text: ""),
        Post(creator: .billie, image: "post4", text: "6 days until Happier Than Ever. (our studio flooded with this in it right after we finished the album, as you can see with the water marks) ahhhh"),
        Post(creator: .billie, image: "post5", text: "nda")
    ]
    
    
}

struct Post: Identifiable {
    var id = UUID()
    var date = Date()
    var creator: Creator
    var image: String
    var text: String
}

enum Creator: String {
    case billie = "Billie Eilish"
    case finneas = "Finneas"
}
