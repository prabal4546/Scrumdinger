//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 21/05/21.
//

import SwiftUI

struct MeetingTimerView: View {
    var scrumColor:Color
    let speakers: [ScrumTimer.Speaker]
    private var currentSpeaker: String { speakers.first(where: { !$0.isCompleted })?.name ?? "Someone" }

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased:true)
            VStack {
                Text("\(currentSpeaker)")
                    .font(.title)
                Text("is speaking")
            }
        }.padding(.horizontal)
//        .foregroundColor(scrumColor.accessibleFontColor)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Grogu", isCompleted: true), ScrumTimer.Speaker(name: "Din Djarin", isCompleted: false)]

    static var previews: some View {
        MeetingTimerView(scrumColor:.blue, speakers: speakers)
    }
}
