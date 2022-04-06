//
//  ContentView.swift
//  Timer
//
//  Created by sora on 2021/10/18.
//

import SwiftUI

struct SampleMessage: View {
    
    var textMessage: String
    
    var body: some View {
        Text(textMessage)
            .padding()
    }
}

struct SampleMessage_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(textMessage: "Hello, World!")
    }
}
