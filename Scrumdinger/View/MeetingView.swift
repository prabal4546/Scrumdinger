//
//  ContentView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    private let speechRecognizer = SpeechRecognizer()
    @State private var transcript = ""
    @State private var isRecording = false
    @StateObject var scrumTimer = ScrumTimer()
    @Binding var scrum:DailyScrum
    var player:AVPlayer{AVPlayer.sharedDingPlayer}
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, scrumColor: scrum.color)
                MeetingTimerView(isRecording:isRecording, scrumColor: scrum.color, speakers: scrumTimer.speakers)
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
            speechRecognizer.record(to: $transcript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed, transcript:transcript)
            scrum.history.append(newHistory)
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
