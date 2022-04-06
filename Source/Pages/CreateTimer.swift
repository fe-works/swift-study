//
//  TimerTextField.swift
//  Timer
//
//  Created by sora on 2021/11/01.
//

//今日の目標: Firebaseにデータを書き込めるようにする
import SwiftUI

struct CreateTimer: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject var timerVM =  TimerMethod()

    var category = ["Work", "Study", "Hobby"]

    @State var title: String = ""
    @State var selected = 0

//    @State var hours: Int = 0
//    @State var minutes: Int = 0

    var body: some View {
        
        VStack{
            Form() {

                //https://stackoverflow.com/questions/61449744/picker-with-hours-and-minutes-swiftui
                Section(header: Text("Informations")){
                    TextField("Title", text: $title)
                        
                        //分・時だけ選べるようにしたい⇔ホイールの実装をする？
                        //DatePicker(selection: $endDate, label: {Text("TimeLimit")})
//
//                        HStack {
//                            Spacer()
//
//                            VStack {
//                                Picker("", selection: $hours){
//                                    ForEach(0..<5, id: \.self) { i in
//                                        Text("\(i) hours").tag(i)
//                                    }
//                                }.pickerStyle(WheelPickerStyle())
//                            }.labelsHidden()
//                            .frame(width: 100)
//                            .clipped()
//                            .contentShape(Rectangle())
//
//                            Spacer()
//                            Divider()
//                                .frame(height: 160)
//                            Spacer()
//
//                            VStack {
//                                Picker("", selection: $minutes){
//                                    ForEach(0..<60, id: \.self) { i in
//                                        Text("\(i) min").tag(i)
//                                    }
//                                }.pickerStyle(WheelPickerStyle())
//                            }.labelsHidden()
//                            .frame(width: 100)
//                            .clipped()
//                            .contentShape(Rectangle())
//
//                            Spacer()
//
//                        }.padding(.horizontal)
            
                    //Category
                    Picker(selection: $selected,label: Text("Category")) {
                        ForEach(0..<category.count) {
                            Text(self.category[$0])
                        }
                    }

                }
            }
        }

        .navigationBarTitle(Text("New Tasks"), displayMode: .inline)
        .navigationBarItems(
        //    leading: Button(action: {}) {
        //        Image(systemName: "chevron.left")
        //        Text("Lists")
        //    },
            
            trailing: Button(action: {
                self.timerVM.createTimer(title: title, category: category[selected])
                presentationMode.wrappedValue.dismiss()

            }) {
                Text("save")
            }
        )
    }
}

struct CreateTimer_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimer()
    }
}
