//
//  TimerCard.swift
//  Timer
//
//  Created by sora on 2021/10/25.
//

import SwiftUI
import Foundation

struct timerCard: View {
    
    @State var countTimer:Timer? = nil
    @State var timeCount: Int = 0
    
    @StateObject var timer: TimerDataType
    @ObservedObject var timerVM =  TimerMethod() //ここの部分を変えたほうが良い

    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                ComponentTitleText(textMessage: timer.title)
                    .frame(width: 80, height: 22, alignment: .leading)
                PageLinkHeadline(textMessage: timer.category)
                    .frame(width: 80, height: 16, alignment: .leading)
                
                ComponentDateText(timeCount: timeCount)
                    .frame(width: 88, alignment: .leading)

            }.padding(.horizontal, 16)
            
            Spacer()
            
            HStack{

                //isFalse
                if(!timer.isRunning){
                    Button(action: {
                        timer.isRunning = true
                        timer.lastStop = Date()
                        self.timerVM.objectWillChange.send()
                        timeCount = self.timerVM.startTimer(timerID: timer.docuID)
                        timer.time = timeCount
                        //let _ = print(timer.time)
                        //let _ = print(timeCountZ)
                        self.startTimer()
                        
                    }, label: {
                        Image(systemName:"play")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.white)

                    })
                        .frame(width:45 ,height:45)
                        .background(Color.green)
                        .cornerRadius(45)

                } else {
                    Button(action: {
                        timer.isRunning = false
                        timer.time = timeCount
                        self.timerVM.objectWillChange.send()
                        self.timerVM.stopTimer(timerID: timer.docuID, result: timeCount)
                        self.stopTimer()
                    
                }, label: {
                    Image(systemName:"pause")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                    })
                    .frame(width:45 ,height:45)
                    .background(Color.yellow)
                    .cornerRadius(45)
                }
                
                if(!timer.isComplete){
                    Button(action: {
                        timer.time = timeCount
                        timer.isRunning = false
                        timer.isComplete = true
                        self.timerVM.objectWillChange.send()
                        self.timerVM.completeTimer(timerID: timer.docuID, result: timeCount)
                    self.stopTimer()

                
                    }, label: {
                        Image(systemName:"checkmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.white)
                        })
                        .frame(width:45 ,height:45)
                        .background(Color.blue)
                        .cornerRadius(45)
                }

                else {
                    Button(action: {
                        timer.isComplete = false
                        self.timerVM.deleteTimer(timerID: timer.docuID)
                    self.stopTimer()

                    }, label: {
                        Image(systemName:"xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.white)
                        })
                        .frame(width:45 ,height:45)
                        .background(Color.red)
                        .cornerRadius(45)
                    }

            }.padding(.horizontal, 16)
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(9)
    }
    
    func startTimer(){
        self.timerVM.objectWillChange.send()
        self.timer.objectWillChange.send()
        
        countTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            timeCount += 1
        }
    }
    
    func stopTimer(){
        self.timer.objectWillChange.send()
        self.timerVM.objectWillChange.send()

        countTimer?.invalidate()
        countTimer = nil
    }
}

struct timerCard_Previews: PreviewProvider {
    
    static var timers = TimerDataType(id: "0", title: "No Title", category: "Other", time: 0, lastStop: Date(),
                                      isComplete: false, isRunning: false, docuID: 0)

    static var previews: some View {

        timerCard(timer: timers)

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray)
                .edgesIgnoringSafeArea(.all)
    }
}

