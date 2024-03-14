//
//  TaskCard.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/7/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct TaskCard: View {
    var task: String
    var taskDate: String?
    var taskTime: String?
    //var category: String?
    @State var isChecked: Bool
    var body: some View {
        ZStack{
            Color("lightGray")
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25.0, height: 25.0)
                    .padding(.trailing)
                    .onTapGesture {
                        print("Task Checked!")
                        if(isChecked){
                            isChecked = false
                        }else{
                            isChecked = true
                        }
                    }
                VStack {
                    HStack {
                        cText(text: task, size: 14)
                            .padding(.bottom, 2)
                            .if(isChecked) { View in
                                View.strikethrough()
                            }
                        Spacer()
                        
                    }
                    if(taskDate != nil && taskTime != nil){
                        HStack() {
                            if(taskDate != nil){
                                cText(text: taskDate!, size: 12, weight: "light")
                                    .if(isChecked) { View in
                                        View.strikethrough()
                                    }
                            }
                            if(taskTime != nil){
                                cText(text: taskTime!, size: 12, weight: "light")
                                    .if(isChecked) { View in
                                        View.strikethrough()
                                    }
                            }
    //                        cText(text: category, size: 12, weight: "light")
    //                            .if(isChecked) { View in
    //                                View.strikethrough()
    //                            }
                            Spacer()
                        }
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 25)
            
        }
        .frame(height: 80)
        .cornerRadius(20)
        .padding(.top, 4)
    }
}

#Preview {
    TaskCard(task: "Update MiniTask  ",
             taskDate: "Mar 15, 2023",
             taskTime: "06:05 am",
             isChecked: false)
}
