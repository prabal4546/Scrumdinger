//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
