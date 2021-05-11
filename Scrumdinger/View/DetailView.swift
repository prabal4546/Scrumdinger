//
//  DetailView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 10/05/21.
//

import SwiftUI

struct DetailView: View {
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @Binding var scrum:DailyScrum
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
        .navigationBarItems(trailing: Button("Edit", action:{
            isPresented = true
            data = scrum.data
        }))
        .fullScreenCover(isPresented: $isPresented, content: {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel",action:{
                        isPresented = false
                    }), trailing: Button("Done"){
                        isPresented = false
//                        scrum.update(from: data)
                    })
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
