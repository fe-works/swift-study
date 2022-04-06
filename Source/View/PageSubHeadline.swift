//
//  ContentView.swift
//  Timer
//
//  Created by sora on 2021/10/18.
//

import SwiftUI

struct PageSubHeadline: View {
    
    var textMessage: String
    
    var body: some View {
        Text(textMessage)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.black)
    }
}

struct PageSubHeadline_Previews: PreviewProvider {
    static var previews: some View {
        PageSubHeadline(textMessage: "Hello, SubWorld!")
    }
}

