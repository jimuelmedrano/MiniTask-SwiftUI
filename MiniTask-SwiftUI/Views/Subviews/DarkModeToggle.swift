//
//  DarkModeToggle.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/19/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct DarkModeToggle: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        ZStack {
            Capsule()
                .frame(width:80,height:44)
                .foregroundColor(Color(UIColor.systemFill))
            ZStack{
                Circle()
                    .frame(width:40, height:40)
                    .foregroundColor(.white)
                Image(systemName: isDarkMode ? "moon.fill" : "sun.max")
                    .foregroundColor(.black)
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x:isDarkMode ? 18 : -18)
            .animation(.snappy)
            .padding(24)
        }
        .onTapGesture {
            self.isDarkMode.toggle()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .ignoresSafeArea(.all)
    }
    
}

#Preview {
    DarkModeToggle()
}

