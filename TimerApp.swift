//
//  TimerApp.swift
//  Timer
//
//  Created by sora on 2021/10/27.
//

import SwiftUI
import Firebase

@main
struct TimerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init(){
        FirebaseApp.configure()
    }
}
