//
//  cMenuPicker.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/11/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct cMenuPicker: View {
    @State var selection: String = ""
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
var optz = ["Red", "Green", "Blue", "Black", "Tartan"]
#Preview {
    cMenuPicker(pickerName: "Category", options: optz)
}
