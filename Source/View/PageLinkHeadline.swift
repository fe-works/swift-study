//
//  PageLinkHeadline.swift
//  Timer
//
//  Created by sora on 2021/10/25.
//

import SwiftUI

struct PageLinkHeadline: View {
    
    var textMessage: String
    
    var body: some View {
        Text(textMessage)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color(UIColor.darkGray))
    }
}

struct PageLinkHeadline_Previews: PreviewProvider {
    static var previews: some View {
        PageLinkHeadline(textMessage: "Hello, SubWorld!")
    }
}

