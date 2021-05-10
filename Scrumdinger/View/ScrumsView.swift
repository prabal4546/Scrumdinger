//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI

struct ScrumsView: View {
    let scrums:[DailyScrum]
    var body: some View {
        List{
            ForEach(scrums){scrum in
                NavigationLink(destination: Text(scrum.title)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action:{}){
            Image(systemName: "plus")
        })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.data
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: scrums)
        }
    }
}
