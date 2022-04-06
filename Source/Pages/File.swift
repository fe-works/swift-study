//import SwiftUI
//
//struct TimerView: View {
//    //var id: Int
//    //var title: String
//    //var category: String
//    //var time: Int
//    //var lastStop: Date
//    //var isComplete: Bool
//    
//    var isOpen = false
//    
//    @ObservedObject var timerVM =  TimerMethod()
//    
//    //assert(timerVM.timers)
//    //@State var createTimer = ""
//    
//    var body: some View {
//
//        NavigationView{
//            VStack {
//                
//                Spacer()
//                    .frame(height:64)
//                
//                // Timerの一覧+見出し
//                PageHeadline(textMessage: "Tasks")
//                    .frame(width: 375, height: 30, alignment: .leading)
//
//                ForEach(timerVM.timers, id: \.id) { i in
//                    if !i.isComplete {
//                        timerCard(timers: i)
//                    }
//                }
//
//                //timerCard(title: "Test", category:"Test")
//
//                PageSubHeadline(textMessage: "Completed")
//                    .frame(width: 375, height: 30, alignment: .leading)
//
//                ForEach(timerVM.timers, id: \.id){ i in
//                    if i.isComplete {
//                        timerCard(timers: i)
//                    }
//                }
//                //timerCard(title: "Test", category:"Test")
//                
//                //下部に隙間を開ける
//                Spacer()
//                
//            }
//            .padding(.horizontal, 16)
//            .background(Color("BG_Gray"))
//            //.onAppear(){
//            //    //print(timerVM.$timers)
//            //    print("AAA")
//            //}
//        
//        //NavigationBarが出ない
//        .navigationBarTitle("Tasks", displayMode: .inline)
//        .navigationBarItems(
//            trailing: NavigationLink(destination: CreateView()){
//                Image(systemName: "plus")
//            }).navigationViewStyle(StackNavigationViewStyle())
//        }
//    }
//    
//    if(isOpen){
//        ZStack(){
//            CreateView()
//                .edgesIgnoringSafeArea(.all)
//        }
//    }
//}
//
//struct CreateView: View{
//    var body: some View{
//        CreateTimer()
//    }
//}
//
//struct Timer_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
