//
//  ITourApp.swift
//  ITour
//
//  Created by Bekir Berke Yılmaz on 2.10.2023.
//

import SwiftUI
import SwiftData

@main
struct ITourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
