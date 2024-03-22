//
//  SettingsView.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/19/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var taskInputText = ""
    @State var theme = "Default"
    var categoryOptions = ["Default", "Light", "Dark"]
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
                cText(text: "Settings", size: 26, weight: "black")
                    .padding(.bottom, 30)
                
                HStack {
                    cText(text: "Theme", size: 18, weight: "black")
                        .padding(.bottom, 10)
                    Spacer()
                    DarkModeToggle()
                }
                Spacer()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    SettingsView()
}
