//
//  TimerCardIsNone].swift
//  Timer
//
//  Created by sora on 2022/01/19.
//

import SwiftUI
import Foundation

struct timerCardIsNone: View {
    var body: some View {
        HStack(){
            Spacer()
            Text("No Task")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.secondary)
                .frame(width: 103, height: 82, alignment: .leading)
            Spacer()
        }
        .padding(.vertical, 12)
        .cornerRadius(9)
    }

}

struct timerCardIsNone_Previews: PreviewProvider {
    
    static var previews: some View {
        timerCardIsNone()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray)
                .edgesIgnoringSafeArea(.all)
    }
}

