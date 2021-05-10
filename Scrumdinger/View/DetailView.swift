//
//  DetailView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 10/05/21.
//

import SwiftUI

struct DetailView: View {
    let scrum:DailyScrum
    var body: some View {
        List{
            Section(header:Text("Meeting Info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                }
                HStack{
                    Label("Meeting Length", systemImage: "clock")
                    Spacer()
                    Text("15 minutes")
                }
                HStack{
                    Label("Meeting Length", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.yellow)
                }
            }
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees,id:\.self){attendee in
                    Label(attendee, systemImage: "person")
                }
            }
        }.listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
