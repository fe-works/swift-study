//
//  Timer.swift
//  Timer
//
//  Created by sora on 2021/11/01.
//

import SwiftUI

struct TimerView: View {

    @ObservedObject var timerVM =  TimerMethod()
    @State var count:Int = 0

    var body: some View {

        NavigationView{
            VStack {
                
                Spacer()
                    .frame(height:64)

                PageHeadline(textMessage: "Tasks")
                    .frame(width: 375, height: 30, alignment: .leading)
                
                ForEach(timerVM.timers, id: \.id){ timer in
                    if !timer.isComplete {
                        timerCard(timer: timer)
                        let _ = print(timer.docuID) //0が来る
                    }
                }
                if timerVM.timers.firstIndex(where: {$0.isComplete == false}) == nil{
                    timerCardIsNone()
                        .padding(.bottom, 24)
                }
                    

                //timerCard(title: "Test", category:"Test")

                PageSubHeadline(textMessage: "Completed")
                    .frame(width: 375, height: 30, alignment: .leading)

                ForEach(timerVM.timers, id: \.id){ timer in
                    if timer.isComplete {
                        timerCard(timer: timer)
                        let _ = print(timer.docuID)
                        
                    }
                }
                
                if timerVM.timers.firstIndex(where: {$0.isComplete == true}) == nil{
                       timerCardIsNone()
                        .padding(.bottom, 24)
                }

                //timerCard(title: "Test", category:"Test")
                
                //下部に隙間を開ける
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .background(Color("BG_Gray"))
            .navigationBarTitle("Tasks", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.timerVM.objectWillChange.send()
                }) {
                    Image(systemName: "arrow.clockwise")
                } ,
                trailing: NavigationLink(destination: CreateView()){
                    Image(systemName: "plus")
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CreateView: View{
    var body: some View{
        CreateTimer()
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
