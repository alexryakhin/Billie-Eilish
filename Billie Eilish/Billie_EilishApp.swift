//
//  Billie_EilishApp.swift
//  Billie Eilish
//
//  Created by Alexander Ryakhin on 8/8/22.
//

import SwiftUI

@main
struct Billie_EilishApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
