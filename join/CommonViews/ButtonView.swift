//
//  Button.swift
//  join
//
//  Created by Kushagra Sinha on 13/12/23.
//

import SwiftUI

struct ButtonView: View {
    @State var label : String
    @State var buttonColor: Color
    var onTap: () -> Void
    
    /// A customizable button view with a capsule background.
    var body: some View {
        ZStack {
            Capsule()
                .fill(buttonColor)
                .frame(width: 275, height: 50)
            Button(action: onTap, label: {
                Text("\(label)")
                    .frame(width: 275, height: 50)
            })
        }
        .foregroundStyle(Color.white)
        .shadow(radius: 4, x: 0, y: 2)
    }
    
}


#Preview {
    ButtonView(label: "Continue", buttonColor: Color.myBackground, onTap: {
        print("Continue Button Pressed")
    })
}
