//
//  ContentView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI
import AVFoundation

struct SpeakerArc:Shape{
    let speakerIndex: Int
    let totalSpeakers: Int
    private var degreesPerSpeaker: Double {
           360.0 / Double(totalSpeakers)
    }
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0, y: rect.origin.y + rect.size.height / 2.0)
        return Path{path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    private var startAngle:Angle{
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    private var endAngle: Angle {
            Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
        }
}
struct MeetingView: View {
    @StateObject var scrumTimer = ScrumTimer()
    @Binding var scrum:DailyScrum
    var player:AVPlayer{AVPlayer.sharedDingPlayer}
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, scrumColor: scrum.color)
                MeetingTimerView(scrumColor: scrum.color, speakers: scrumTimer.speakers)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            
        }
        .padding()
//        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear{
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed)
            scrum.history.append(newHistory)
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
