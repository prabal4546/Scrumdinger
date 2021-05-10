//
//  EditView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 10/05/21.
//

import SwiftUI

struct EditView: View {
    @State private var scrumData:DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View {
        List{
            Section(header:Text("Meeting Info")){
                TextField("meeting title",text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes,in: 5...30,step: 1.0)
                    Text("Length")
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) min")
                    ColorPicker("Color", selection: $scrumData.color)
                }
            }
            Section(header:Text("Attendees")){
                ForEach(scrumData.attendees, id: \.self){attendee in
                    Text(attendee)
                }.onDelete(perform: { indexSet in
                    //delete
                    scrumData.attendees.remove(atOffsets: indexSet)
                })
                
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action:{
                        withAnimation{
                            //add new attendee
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                        
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
