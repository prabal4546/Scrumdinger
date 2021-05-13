//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by PRABALJIT WALIA     on 11/05/21.
//

import SwiftUI

struct MeetingFooterView: View {
    var body: some View {
        HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView()
    }
}
