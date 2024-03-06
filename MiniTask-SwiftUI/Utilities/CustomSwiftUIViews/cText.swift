//
//  cText.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/5/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct cText: View {
    var text: String
    var size: CGFloat
    var weight: String?
    var body: some View {
        switch weight {
        case "light":
            Text(text)
                .font(.custom("Comfortaa", size: size))
                .fontWeight(.light)

        case "medium":
            Text(text)
                .font(.custom("Comfortaa", size: size))
                .fontWeight(.light)
            
        case "bold":
            Text(text)
                .font(.custom("Comfortaa", size: size))
                .fontWeight(.bold)
            
        case "black":
            Text(text)
                .font(.custom("Comfortaa", size: size))
                .fontWeight(.black)

        default:
            Text(text)
                .font(.custom("Comfortaa", size: size))
        }
        
    }
}

#Preview {
    cText(text: "cText", size: 20)
}
