//
//  CopmonentTitleText.swift
//  Timer
//
//  Created by sora on 2021/10/25.
//

import SwiftUI

struct ComponentTitleText: View {
    
    var textMessage: String
    
    var body: some View {
        Text(textMessage)
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.black)
    }
}

struct ComponentTitleText_Previews: PreviewProvider {
    static var previews: some View {
        ComponentTitleText(textMessage: "Hello, SubWorld!")
    }
}


