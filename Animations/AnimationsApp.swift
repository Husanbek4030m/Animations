//
//  AnimationsApp.swift
//  Animations
//
//  Created by Karavella on 04/08/22.
//

import SwiftUI

@main
struct AnimationsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
