//
//  ComponentDateText.swift
//  Timer
//
//  Created by sora on 2021/10/25.
//

import SwiftUI

struct ComponentDateText: View {
    var timeCount: Int = 0
    
    var body: some View {
        let Hours: Int = self.timeCount/3600
        let Minutes: Int = (self.timeCount - (3600*Hours))/60
        let Seconds: Int = (self.timeCount - (3600*Hours) - (60*Minutes))
        
        let strHour = String(format: "%02d", Hours)
        let strMinutes = String(format: "%02d", Minutes)
        let strSeconds = String(format: "%02d", Seconds)

        Text("\(strHour):\(strMinutes):\(strSeconds)")
            .font(.system(size: 20, weight: .light))
            .foregroundColor(.black)
    }
}

struct ComponentDateText_Previews: PreviewProvider {
    static var previews: some View {
        let timeCount:Int = 3600
        ComponentDateText(timeCount: timeCount)
    }
}


