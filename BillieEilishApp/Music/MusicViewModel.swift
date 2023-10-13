//
//  MusicViewModel.swift
//  BillieEilishApp
//
//  Created by Alexander Bonney on 7/3/21.
//

import Foundation
import MusicKit
import CloudKit


class MusicViewModel: ObservableObject {
    
    @Published var artist: Artist?
    @Published var albums = [Album]()
    
    func getData() async {
        guard let url = URL(string: urlHeader + urlAlbums) else {
            return
        }

        let searchRequest = MusicDataRequest(urlRequest: URLRequest(url: url))
        
        do {
            let dataResponse = try await searchRequest.response()
//            print(String(data: dataResponse.data, encoding: .utf8)!)
            let decoded = try JSONDecoder().decode(ResponseAlbum.self, from: dataResponse.data)
//            let artists = decoded.data
//            self.artist = artists.first
            self.albums = decoded.data
            print(albums)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}

let urlHeader = "https://api.music.apple.com"
let appleMusicBillieURL = "https://api.music.apple.com/v1/catalog/us/artists/1065981054"
let urlAlbums = "/v1/catalog/us/artists/1065981054/albums"

let url = "https://itunes.apple.com/search?term=billieeilish&entity=song"


struct ResponseArtist: Codable {
    var data: [Artist]
}

struct ResponseAlbum: Codable {
    var data: [Album]
}



/*
 {
     "id": "1065981054",
     "type": "artists",
     "href": "/v1/catalog/us/artists/1065981054",
     "attributes": {
         "url": "https://music.apple.com/us/artist/billie-eilish/1065981054",
         "name": "Billie Eilish",
         "genreNames": ["Alternative"]
     },
     "relationships": {
         "albums": {
             "href": "/v1/catalog/us/artists/1065981054/albums",
             "data": [{
                 "id": "1564530719",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1564530719"
             }, {
                 "id": "1450695723",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1450695723"
             }, {
                 "id": "1440898929",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1440898929"
             }, {
                 "id": "1564530526",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1564530526"
             }, {
                 "id": "1440894250",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1440894250"
             }, {
                 "id": "1369379667",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1369379667"
             }, {
                 "id": "1487502456",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1487502456"
             }, {
                 "id": "1498647640",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1498647640"
             }, {
                 "id": "1539499185",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1539499185"
             }, {
                 "id": "1362273458",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1362273458"
             }, {
                 "id": "1525322225",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1525322225"
             }, {
                 "id": "1445297971",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1445297971"
             }, {
                 "id": "1442107599",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1442107599"
             }, {
                 "id": "1472563379",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1472563379"
             }, {
                 "id": "1448440122",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1448440122"
             }, {
                 "id": "1444889914",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1444889914"
             }, {
                 "id": "1444890649",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1444890649"
             }, {
                 "id": "1354027915",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1354027915"
             }, {
                 "id": "1492126606",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1492126606"
             }, {
                 "id": "1445287007",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1445287007"
             }, {
                 "id": "1554563080",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1554563080"
             }, {
                 "id": "1444861647",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1444861647"
             }, {
                 "id": "1549917101",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1549917101"
             }, {
                 "id": "1444885102",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1444885102"
             }, {
                 "id": "1444871456",
                 "type": "albums",
                 "href": "/v1/catalog/us/albums/1444871456"
             }]
         }
     }
 }
 
 */

/*
 [Album(
   id: "1564530719",
   title: "Happier Than Ever",
   artistName: "Billie Eilish",
   contentRating: "explicit",
   copyright: ℗ 2021 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2021-07-30",
   trackCount: 16,
   upc: "00602438254743"
 ), Album(
   id: "1450695723",
   title: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?",
   artistName: "Billie Eilish",
   copyright: ℗ 2019 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Electronic",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2019-03-29",
   trackCount: 14,
   upc: "00602577427657"
 ), Album(
   id: "1440898929",
   title: "dont smile at me",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock",
     "Electronic"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2017-12-22",
   trackCount: 9,
   upc: "00602567328056"
 ), Album(
   id: "1564530526",
   title: "Happier Than Ever",
   artistName: "Billie Eilish",
   contentRating: "clean",
   copyright: ℗ 2021 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2021-07-30",
   trackCount: 16,
   upc: "00602438254750"
 ), Album(
   id: "1440894250",
   title: "Ocean Eyes (The Remixes) - EP",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: false,
   releaseDate: "2017-01-13",
   trackCount: 4,
   upc: "00602557422078"
 ), Album(
   id: "1369379667",
   title: "lovely - Single",
   artistName: "Billie Eilish & Khalid",
   copyright: ℗ 2018 Darkroom/Interscope Records,
   genreNames: [
     "Pop",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2018-04-19",
   trackCount: 1,
   upc: "00602567150954"
 ), Album(
   id: "1487502456",
   title: "everything i wanted - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2019 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2019-11-13",
   trackCount: 1,
   upc: "00602508508455"
 ), Album(
   id: "1498647640",
   title: "No Time To Die - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2020 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2020-02-13",
   trackCount: 1,
   upc: "00602508811289"
 ), Album(
   id: "1539499185",
   title: "Therefore I Am - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2020 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: false,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2020-11-12",
   trackCount: 1,
   upc: "00602435478104"
 ), Album(
   id: "1362273458",
   title: "bitches broken hearts - Single",
   artistName: "Billie Eilish",
   contentRating: "explicit",
   copyright: ℗ 2018 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2017-11-10",
   trackCount: 1,
   upc: "00602567526629"
 ), Album(
   id: "1525322225",
   title: "my future - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2020 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: false,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2020-07-30",
   trackCount: 1,
   upc: "00602507395414"
 ), Album(
   id: "1445297971",
   title: "Six Feet Under (The Remixes) - EP",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: false,
   releaseDate: "2017-02-03",
   trackCount: 4,
   upc: "00602557431483"
 ), Album(
   id: "1442107599",
   title: "come out and play - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2018 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2018-11-20",
   trackCount: 1,
   upc: "00602577288890"
 ), Album(
   id: "1472563379",
   title: "bad guy - Single",
   artistName: "Billie Eilish & Justin Bieber",
   copyright: ℗ 2019 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2019-07-11",
   trackCount: 1,
   upc: "00602508103032"
 ), Album(
   id: "1448440122",
   title: "WHEN I WAS OLDER (Music Inspired by the Film "ROMA") - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2019 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2019-01-09",
   trackCount: 1,
   upc: "00602577427299"
 ), Album(
   id: "1444889914",
   title: "Six Feet Under - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2016 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: true,
   releaseDate: "2016-11-17",
   trackCount: 1,
   upc: "00602557280906"
 ), Album(
   id: "1444890649",
   title: "&burn - Single",
   artistName: "Billie Eilish & Vince Staples",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Pop",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2017-12-15",
   trackCount: 1,
   upc: "00602567233411"
 ), Album(
   id: "1354027915",
   title: "MyBoi (TroyBoi Remix) - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2018 Darkroom/Interscope Records,
   genreNames: [
     "Dance",
     "Music",
     "Electronic"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: true,
   releaseDate: "2018-03-09",
   trackCount: 1,
   upc: "00602567510369"
 ), Album(
   id: "1492126606",
   title: "Billie Eilish Live at the Steve Jobs Theater - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2019 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2019-12-19",
   trackCount: 2,
   upc: "00602508659515"
 ), Album(
   id: "1445287007",
   title: "Bellyache (Marian Hill Remix) - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: true,
   releaseDate: "2017-05-05",
   trackCount: 1,
   upc: "00602557646214"
 ), Album(
   id: "1554563080",
   title: "ilomilo (Live From the Film - Billie Eilish: The World's A Little Blurry) - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2021 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2021-02-22",
   trackCount: 1,
   upc: "00602435854267"
 ), Album(
   id: "1444861647",
   title: "Bored - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Rock"
   ],
   isCompilation: false,
   isComplete: false,
   isDigitalMaster: false,
   isSingle: true,
   releaseDate: "2017-03-30",
   trackCount: 1,
   upc: "00602557633917"
 ), Album(
   id: "1549917101",
   title: "Lo Vas A Olvidar - Single",
   artistName: "Billie Eilish & ROSALÍA",
   copyright: ℗ 2021 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",
     "Latin"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: true,
   releaseDate: "2021-01-21",
   trackCount: 1,
   upc: "00602507219611"
 ), Album(
   id: "1444885102",
   title: "COPYCAT (Sofi Tukker Remix) - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2018 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music",

     "Rock"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: false,
   isSingle: true,
   releaseDate: "2018-01-12",
   trackCount: 1,
   upc: "00602567274223"
 ), Album(
   id: "1444871456",
   title: "Up Next Session: Billie Eilish (Live) - Single",
   artistName: "Billie Eilish",
   copyright: ℗ 2017 Darkroom/Interscope Records,
   genreNames: [
     "Alternative",
     "Music"
   ],
   isCompilation: false,
   isComplete: true,
   isDigitalMaster: true,
   isSingle: false,
   releaseDate: "2017-09-20",
   trackCount: 3,
   upc: "00602567002796"
 )]

 */
