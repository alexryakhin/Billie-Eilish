//
//  AlbumView.swift
//  AlbumView
//
//  Created by Alexander Bonney on 7/24/21.
//
import MusicKit
import SwiftUI

struct AlbumView: View {
    let album: Album
    @State var tracks: MusicItemCollection<Track>?
    
    var body: some View {
        List {
            VStack(spacing: 5) {
                VStack {
                    if let artwork = album.artwork {
                        ArtworkImage(artwork, width: 320)
                            .cornerRadius(8)
                    }
                    Text(album.artistName)
                        .font(.title2.bold())
//                    playButtonRow
                }
                
                Text(album.title).bold().multilineTextAlignment(.center).font(.system(size: 20)).padding(.top)
                
                Text("Billie Eilish").foregroundColor(.red).font(.title3)
                
                HStack {
                    Text("ALTERNATIVE").font(.caption)
                    Image(systemName: "circle.fill").font(.system(size: 3))
                    Text("2019").font(.caption)
                }.foregroundColor(.secondary)
                
                Text(album.description).lineLimit(2).foregroundColor(.secondary)
            }
            
            
            if let loadedTracks = tracks, !loadedTracks.isEmpty {
                Section(header: Text("Tracks")) {
                    ForEach(loadedTracks) { track in
                        TrackCell(track, from: album) {
//                            task {
//                                await handleTrackSelected(track, loadedTracks: loadedTracks)
//                            }
                        }
                    }
                }
            }
            
            
        }
        .listStyle(.plain)
    }
    
    private func loadTracksAndRelatedAlbums() async throws {
        let detailedAlbum = try await album.with([.artists, .tracks])
        let artist = try await detailedAlbum.artists?.first?.with([.albums])
        await update(tracks: detailedAlbum.tracks, relatedAlbums: artist?.albums)
    }
    
    @MainActor
    private func update(tracks: MusicItemCollection<Track>?, relatedAlbums: MusicItemCollection<Album>?) {
        withAnimation {
            self.tracks = tracks
        }
    }
}

