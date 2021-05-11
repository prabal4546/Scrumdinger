//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
