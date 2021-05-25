//
//  History.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 17/05/21.
//

import Foundation

struct History: Identifiable,Codable {
    var transcript:String?
    let id: UUID
    let date: Date
    var attendees: [String]
    var lengthInMinutes: Int

    init(id: UUID = UUID(), date: Date = Date(), attendees: [String], lengthInMinutes: Int, transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript = transcript
    }
}
