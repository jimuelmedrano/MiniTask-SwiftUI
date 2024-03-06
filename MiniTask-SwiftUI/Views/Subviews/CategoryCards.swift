//
//  CategoryCards.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/6/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct CategoryCards: View {
    var iconName: String
    var categoryName: String
    var body: some View {
        VStack {
            ZStack{
                Color("lightGray")
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30.0)
            }
            .frame(width: 70,height: 70)
            .cornerRadius(20)
            .padding(.bottom, 3)
            cText(text: categoryName, size: 14, weight: "bold")
        }
        .padding(.leading, 5)
    }
}

#Preview {
    CategoryCards(iconName: "bag", categoryName: "Shopping")
}
