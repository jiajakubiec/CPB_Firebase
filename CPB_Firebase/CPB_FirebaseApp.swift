//
//  CPB_FirebaseApp.swift
//  CPB_Firebase
//
//  Created by Jia Jakubiec on 11/6/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift

@main
struct CPB_FirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: College.self)
    }
}
