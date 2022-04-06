//
//  ContentView.swift
//  Timer
//
//  Created by sora on 2021/10/18.
//

import SwiftUI

struct PageHeadline: View {
    
    var textMessage: String
    
    var body: some View {
        Text(textMessage)
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.black)
    }
}

struct PageHeadline_Previews: PreviewProvider {
    static var previews: some View {
        PageHeadline(textMessage: "Hello, World!")
    }
}
