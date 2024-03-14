//
//  MaskTest.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/14/24.
//  Copyright © 2024 jimuelmedrano. All rights reserved.
//

import SwiftUI

struct MaskTest: View {
    var body: some View {
        Color.yellow
          .frame(width: 200, height: 200)
          .mask {
              LinearGradient(colors: [.clear, .black, .clear], startPoint: .leading, endPoint: .trailing)
            }
          .border(Color.red)
    }
}

#Preview {
    MaskTest()
}
