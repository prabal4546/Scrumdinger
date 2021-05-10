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
                Label("Start Meeting", systemImage: "timer")
                    .foregroundColor(.accentColor)
                    .font(.headline)
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
        }.listStyle(InsetGroupedListStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
