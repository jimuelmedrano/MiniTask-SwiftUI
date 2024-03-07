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
    var time: String?
    var category: String
    @State var isChecked: Bool
    var body: some View {
        ZStack{
            Color("lightGray")
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
                    .padding(.trailing)
                    .aspectRatio(contentMode: .fit)
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
                    HStack() {
                        if(time != nil){
                            cText(text: time!, size: 12, weight: "light")
                                .if(isChecked) { View in
                                    View.strikethrough()
                                }
                        }
                        cText(text: category, size: 12, weight: "light")
                            .if(isChecked) { View in
                                View.strikethrough()
                            }
                        Spacer()
                    }
                }
                Spacer()
                
            }
            .padding(.horizontal, 25)
            
        }
        .frame(height: 80)
        .cornerRadius(20)
        .padding(.bottom, 3)
    }
}

#Preview {
    TaskCard(task: "Update MiniTask Design",
             time: "08:00am - 09:00am",
             category: "Shopping", isChecked: true)
}
