//
//  cTimePicker.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/12/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct TestcTimePicker: View {
    
    @State private var secOneDate: Date = Date()
    @State private var isDatepickerOnePresented = false
    @State private var isTimeValueSelected = false

    var body: some View {
        VStack {
            
            
            HStack{
                Button{
                    isDatepickerOnePresented = true
                } label: {
                    cText(text: "\(secOneDate.formatted(.dateTime.hour().minute()))", size: 18)
                }
                .sheet(isPresented: $isDatepickerOnePresented) {
                    cTimePicker(selectDate: $secOneDate,isValueSelected: $isTimeValueSelected)
                        .presentationDetents([.medium])
                }
                
            }
            .padding()
            
        }
    }
}

struct cTimePicker: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectDate: Date
    @Binding var isValueSelected: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                cText(text: "Select Time", size: 20, weight: "bold")
                Spacer()
                Button {
                    isValueSelected = false
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(UIColor.placeholderText))
                }
                
            }
            .padding(.bottom, 30)
            
            
            DatePicker("", selection: $selectDate, displayedComponents: [.hourAndMinute])
                .datePickerStyle(.wheel)
            Spacer()
            ZStack{
                Color("lightGray")
                cText(text: "Confirm", size: 18)
            }
            .frame(height: 50)
            .cornerRadius(20)
            .onTapGesture {
                isValueSelected = true
                dismiss()
            }
        }
        .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
    }
}

#Preview {
    TestcTimePicker()
}
