//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 11/05/21.
//

import SwiftUI

struct MeetingFooterView: View {
    var speakers:[ScrumTimer.Speaker]
    var skipAction:()->Void
    var speakerNumber:Int?{
        guard let index = speakers.firstIndex(where: {$0.isCompleted}) else{
            return nil
        }
        return index + 1
    }
    private var isLastSpeaker: Bool {
            return speakers.dropLast().allSatisfy { $0.isCompleted }
        }
    var speakerText:String{
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
                return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            
            HStack {
                if isLastSpeaker{
                    Text("Last Speaker")
                }else{
                        Text(speakerText)
                        Spacer()
                        Button(action: {skipAction()}) {
                            Image(systemName:"forward.fill")
                        }
                        .accessibilityLabel(Text("Next speaker"))
                }
            }
        }.padding([.bottom,.horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Grogu", isCompleted: true)]
    static var previews: some View {
        MeetingFooterView(speakers: speakers, skipAction: {})
    }
}
