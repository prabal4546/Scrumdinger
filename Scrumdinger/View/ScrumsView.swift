//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums:[DailyScrum]
    var body: some View {
        List{
            ForEach(scrums){scrum in
                NavigationLink(destination:DetailView(scrum: binding(for: scrum))){
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
    private func binding(for scrum:DailyScrum)->Binding<DailyScrum>{
        guard let scrumIndex = scrums.firstIndex(where: {$0.id == scrum.id})else{
            fatalError("can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.data
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(scrums))
        }
    }
}
