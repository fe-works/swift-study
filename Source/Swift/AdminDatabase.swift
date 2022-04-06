//
//  AdminDatabase.swift
//  Timer
//
//  Created by sora on 2021/11/15.
//

import Foundation
import Firebase

// Identifiable ってなんだっけ
class TimerDataType: ObservableObject, Identifiable {
    var id: String
    var title: String
    var category: String
    var time: Int
    var lastStop: Date
    var isComplete: Bool
    var isRunning: Bool
    var docuID: Int
    
    //    var id: String = "0"
    //    var title: String = "No Title"
    //    var category: String = "Other"
    //    var time: Int = 0
    //    var lastStop: Date = Date()
    //    var isComplete: Bool = false
    //    var isRunning: Bool = false
    //    var docuID: Int = 0
    
    init(id: String, title: String, category: String, time: Int, lastStop: Date,
         isComplete: Bool, isRunning: Bool, docuID: Int){
        self.id = id
        self.title = title
        self.category = category
        self.time = time
        self.lastStop = lastStop
        self.isComplete = isComplete
        self.isRunning = isRunning
        self.docuID = docuID
    }
}


class TimerMethod: ObservableObject {
    @Published var timers = [TimerDataType]()
    
    init(){
        let db = Firestore.firestore()

        //dbから同操作してくるか
        db.collection("timers").addSnapshotListener{(snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            //snap
            if let snap = snap {
                for i in snap.documentChanges {
                    if i.type == .added {
                        let name = i.document.get("title") as! String
                        let category = i.document.get("category") as! String
                        let time = i.document.get("time") as! Int
                        let isComplete = i.document.get("isComplete") as! Bool
                        let id = i.document.documentID
                        let lastStop = i.document.get("lastStop") as! Timestamp
                        let isRunning = i.document.get("isRunning") as! Bool
                        let docuID =  (self.timers.count)
                        self.timers.append(TimerDataType(id: id, title: name, category: category, time: time, lastStop: lastStop.dateValue(), isComplete: isComplete, isRunning: isRunning, docuID: docuID))
                    }
                }
            }
        }
        
    }
    
    //各ファンクション(Start, Stop, Delete)
    func createTimer(title: String, category: String) {
        let data = [
            "id": timers.count,
            "title": title,
            "category": category,
            "time": 0,
            "lastStop": Date(),
            "isComplete": false,
            "isRunning": false
        ] as [String : Any] //型変換が怪しい
        
        let db = Firestore.firestore()
        
        db.collection("timers").document(title).setData(data) {error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("sucsess")
            //self.timers.append(TimerDataType(id: id, title: name, category: category, time: time, lastStop: lastStop.dateValue(), isComplete: isComplete, isRunning: isRunning, docuID: docuID))
        }
    }
    
    //Delete Function
    //とりあえず, docuIDが推測できればどうにかなるだろう的な読み
    func deleteTimer(timerID: Int){
        let db = Firestore.firestore()
        
        // Firestore_Sample
        db.collection("timers").document(timers[Int(timerID)].title).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }

        print(timers.count)
        self.timers.remove(at: timerID)
        print(timers.count)
    }
        
    func startTimer(timerID: Int) -> Int {
        let db = Firestore.firestore().collection("timers").document(timers[Int(timerID)].title)
        var time: Int = 0

        let semaphore = DispatchSemaphore(value: 0)

        db.updateData([
            "isRunning": true,
            "Date": Date()
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated!")
            }
        }

        db.getDocument (completion: { (snap, err) in
            if let err = err {
                print("Error opening document: \(err)")
            } else {
                if let userInfo = snap?.data() as? [String: Any] {
                    time = userInfo["time"] as! Int
                    print(time)
                }
            }
            
            semaphore.signal()
        })

        self.timers[Int(timerID)].isRunning = true

        switch semaphore.wait(timeout: .now() + 2) {
        case .success:
            return time
        case .timedOut:
            return self.timers[Int(timerID)].time
        }
    }

//func startTimer(timerID: Int) -> Int {
//        let db = Firestore.firestore().collection("timers").document(timers[Int(timerID)].title)
//        var time: Int = 0
//
//        let dispatchGroup = DispatchGroup()
//        let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
//
//        db.updateData([
//            "isRunning": true,
//            "Date": Date()
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated!")
//            }
//        }
//        dispatchGroup.enter()
//        dispatchQueue.async(group: dispatchGroup) {
//            db.getDocument (completion: { (snap, err) in
//                if let err = err {
//                    print("Error opening document: \(err)")
//                } else {
//                    if let userInfo = snap?.data() as? [String: Any] {
//                        time = userInfo["time"] as! Int
//                        print(time)
//                    }
//                }
//
//                dispatchGroup.leave()
//            })
//        }
//
//        dispatchGroup.notify(queue: .main) {
//            print(time)
//        }
//
//
//
//        self.timers[Int(timerID)].isRunning = true
//        return time
//    }
    
    func stopTimer(timerID: Int, result: Int){
        let db = Firestore.firestore().collection("timers").document(timers[Int(timerID)].title)
        
        db.updateData([
            "time": result,
            "isRunning": false
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated!")
            }
        }
        timers[Int(timerID)].isRunning = false
        timers[Int(timerID)].time = result
    }
    
    func completeTimer(timerID: Int, result: Int){
            let db = Firestore.firestore().collection("timers").document(timers[Int(timerID)].title)
            
            db.updateData([
                "time": result,
                "isRunning": false,
                "isComplete": true
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated!")
                }
            }
        
        self.timers[Int(timerID)].isComplete = true
        self.timers[Int(timerID)].isRunning = false
        }
}
