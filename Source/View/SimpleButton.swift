//
//  ContentView.swift
//  Timer
//
//  Created by sora on 2021/10/18.
//

import SwiftUI

struct SimpleButton: View {
    
    var systemName: String
    var InputColor: Color

    var body: some View {
        ZStack{
            Spacer()
                .frame(width:45 ,height:45)
                .background(InputColor)
                .cornerRadius(45)

            Image(systemName:systemName)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.white)

        }

    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton(systemName:"folder.fill", InputColor: Color.purple)
    }
}

