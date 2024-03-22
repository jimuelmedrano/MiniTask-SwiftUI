//
//  AddTaskView.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/8/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var taskInputText = ""
    @State var categorySelection = ""
    @State var repeatSelection = "Do Not Repeat"
    var categoryOptions = ["Work", "Home", "School", "Shopping", "Personal"]
    var repeatOptions = ["Do Not Repeat", "Everyday", "Weekends", "Weekdays", "Every Other Day"]
    @State private var date = Date()
    @State private var isDatepickerPresented = false
    @State private var isDateValueSelected = false
    @State private var time = Date()
    @State private var isTimepickerPresented = false
    @State private var isTimeValueSelected = false
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack (alignment: .leading){
                Image(systemName: "arrow.left")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25.0, height: 25.0)
                    .padding(.bottom)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                cText(text: "Add Task", size: 26, weight: "black")
                    .padding(.bottom)
                
                //MARK: - Task Label
                cText(text: "Task Label", size: 18, weight: "black")
                    .padding(.bottom, 10)
                ZStack{
                    Color("lightGray")
                    TextField("Input new task...", text: $taskInputText)
                        .font(.custom("Comfortaa", size: 16))
                        .padding()
                }
                .frame(height: 50)
                .cornerRadius(15)
                .padding(.bottom)
                
                // MARK: - Category
                cText(text: "Category", size: 18, weight: "black")
                    .padding(.bottom, 10)
                ZStack(alignment: .leading){
                    Color("lightGray")
                    cMenuPicker(selection: $categorySelection, pickerName: "Category", options: categoryOptions)
                        .padding(.horizontal, 5)
                }
                .frame(height: 50)
                .cornerRadius(15)
                .padding(.bottom)
                
                // MARK: - Date and Time
                HStack{
                    VStack (alignment: .leading){
                        HStack {
                            cText(text: "Date", size: 18, weight: "black")
                                .padding(.bottom, 10)
                            
                        }
                        ZStack {
                            Color("lightGray")
                            Button{
                                isDatepickerPresented = true
                            } label: {
                                cText(text: isDateValueSelected ?  "\(date.formatted(.dateTime.day().month().year()))" : "Select Date", size: 16)
                                    .if(isDateValueSelected, transform: { View in
                                        View.foregroundStyle(Color(UIColor.label))
                                    })
                                    .foregroundStyle(Color(UIColor.placeholderText))
                                
                            }
                            .sheet(isPresented: $isDatepickerPresented) {
                                cDatePicker(selectDate: $date, isValueSelected: $isDateValueSelected)
                                    .presentationDetents([.fraction(0.8)])
                                    .presentationCornerRadius(20)
                            }
                        }
                        .frame(height: 50)
                        .cornerRadius(15)
                        
                    }
                    Spacer()
                    VStack (alignment: .leading){
                        cText(text: "Time", size: 18, weight: "black")
                            .padding(.bottom, 10)
                        ZStack {
                            Color("lightGray")
                            Button{
                                isTimepickerPresented = true
                            } label: {
                                cText(text: isTimeValueSelected ?  "\(time.formatted(.dateTime.hour().minute()))" : "Select Time", size: 16)
                                    .if(isTimeValueSelected, transform: { View in
                                        View.foregroundStyle(Color(UIColor.label))
                                    })
                                    .foregroundStyle(Color(UIColor.placeholderText))
                            }
                            .sheet(isPresented: $isTimepickerPresented) {
                                cTimePicker(selectDate: $time, isValueSelected: $isTimeValueSelected)
                                    .presentationDetents([.medium])
                                    .presentationCornerRadius(20)
                            }
                        }
                        .frame(height: 50)
                        .cornerRadius(15)
                    }
                    Spacer()
                }
                .padding(.bottom)
                
                //MARK: - Repeat Options
                cText(text: "Repeat", size: 18, weight: "black")
                    .padding(.bottom, 10)
                ZStack(alignment: .leading){
                    Color("lightGray")
                    cMenuPicker(selection: $repeatSelection, pickerName: "Repeat Option", options: repeatOptions)
                        .padding(.horizontal, 5)
                }
                .frame(height: 50)
                .cornerRadius(15)
                Spacer()
                //MARK: - Confirm Button
                ZStack{
                    Color("foreground")
                    cText(text: "Create new task", size: 18, weight: "bold")
                        .foregroundColor(.white)
                }
                .frame(height: 60)
                .cornerRadius(20)
                .padding(.top)
            }
            .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AddTaskView()
}



