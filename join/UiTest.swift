//
//  UiTest.swift
//  join
//
//  Created by Kushagra Sinha on 23/12/23.
//

import SwiftUI

struct UiTest: View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea()
        }
    }
}

#Preview {
    UiTest()
}
