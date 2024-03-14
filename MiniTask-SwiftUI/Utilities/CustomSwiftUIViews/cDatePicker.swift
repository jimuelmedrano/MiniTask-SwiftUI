//
//  cDatePicker.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/12/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct TestcDatePicker: View {
    
    @State private var secOneDate: Date = Date()
    @State private var isDatepickerOnePresented = false
    @State private var isDateValueSelected = false

    var body: some View {
        VStack {
            
            
            HStack{
                Button{
                    isDatepickerOnePresented = true
                } label: {
                    cText(text: "\(secOneDate.formatted(.dateTime.day().month().year()))", size: 18)
                }
                .sheet(isPresented: $isDatepickerOnePresented) {
                    cDatePicker(selectDate: $secOneDate,isValueSelected: $isDateValueSelected)
                        .presentationDetents([.fraction(0.8)])
                }
                
            }
            .padding()
            
        }
    }
}

struct cDatePicker: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectDate: Date
    @Binding var isValueSelected: Bool
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(alignment: .center) {
                HStack {
                    cText(text: "Select Date", size: 20, weight: "bold")
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
                DatePicker("", selection: $selectDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                //Text("\(selectDate.formatted(date: .abbreviated, time: .shortened))")
                Spacer()
                cText(text: "\(selectDate.formatted(.dateTime.day().month().year()))", size: 18)
                    .padding(.bottom)
                ZStack{
                    Color("lightGray")
                    cText(text: "Confirm", size: 18)
                }
                .frame(height: 60)
                .cornerRadius(20)
                .onTapGesture {
                    isValueSelected = true
                    dismiss()
                }
            }
            .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
        }
    }
}

#Preview {
    TestcDatePicker()
}
