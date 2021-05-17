//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 09/05/21.
//

import SwiftUI

struct ScrumsView: View {
    @State private var isPresented = false
    @State private var newScrumData = DailyScrum.Data()
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
        .navigationBarItems(trailing: Button(action:{
            isPresented = true
        }){
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented){
            NavigationView {
                    EditView(scrumData: $newScrumData)
                        .navigationBarItems(leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
                            let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees,
                                                      lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                            scrums.append(newScrum)
                            isPresented = false
                        })
                }
            }
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
