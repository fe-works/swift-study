//
//  ContentView.swift
//  Timer
//
//  Created by sora on 2021/10/18.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView{
            FirstView()
                .tabItem{
                    Text("Schedules")
                    Image(systemName: "calendar.badge.clock")
                }
            SecondView()
                .tabItem{
                    Text("Create")
                    Image(systemName: "clock.arrow.2.circlepath")
                }
//            ThirdView()
//                .tabItem{
//                    Text("Analytics")
//                    Image(systemName: "chart.bar.xaxis")
//                }
        }
    }
}

struct FirstView: View{
    var body: some View{
        TimerView()
    }
}

struct SecondView: View{
    var body: some View{
        CreateTimer()
    }
}

//struct ThirdView: View{
//    var body: some View{
//        Text("Hello,World!")
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
