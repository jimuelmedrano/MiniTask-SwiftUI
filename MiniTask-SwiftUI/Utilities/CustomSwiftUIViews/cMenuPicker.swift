//
//  cMenuPicker.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/11/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct TestcMenuPicker: View {
    
    @State private var testSelection: String = ""
    var optz = ["Red", "Green", "Blue", "Black", "Tartan"]
    var body: some View {
        ZStack(alignment: .leading){
            Color("lightGray")
            cMenuPicker(selection: $testSelection, pickerName: "Category", options: optz)
                .padding(.horizontal, 5)
        }
        .frame(height: 50)
        .cornerRadius(15)
        .padding(.bottom)
    }
}

struct cMenuPicker: View {
    @Binding var selection: String
    var pickerName: String
    var options: [String]
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: { selection = option
                }) {
                    Text(option)
                }
            }
        } label: {
            HStack {
                cText(text: selection == "" ? "Select \(pickerName)" : selection, size: 16)
                    .if(selection == "" , transform: { View in
                        View.foregroundColor(Color(UIColor.placeholderText))
                    })
                    .foregroundColor(Color(UIColor.label))
                Spacer()
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 10.0, height: 10.0)
                    .foregroundColor(Color(UIColor.placeholderText))
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    TestcMenuPicker()
}
