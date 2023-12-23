//
//  LanguageSelectionScreen.swift
//  join
//
//  Created by Kushagra Sinha on 13/12/23.
//

import SwiftUI

struct LanguageSelectionScreen: View {
    @Binding var showOnBoardingScreen: Bool
    var body: some View {
        ZStack {
            // Background Image
            Image("background_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .zIndex(1.0)
            
            // Linear Gradient [ .Clear to .appBackground ]
            LinearGradient(gradient: Gradient(colors: [.clear, Color.appBackground.opacity(0.05)]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .zIndex(2.0)
            
            // Join (White) Logo
            VStack {
                Image("logo_white")
                    .shadow(radius: 10)
                    .frame(width: 200, height: 250)
                Spacer()
            }
            .zIndex(3.0)
            
            // Language Selector View
            VStack(spacing: 20) {
                Text("\(Constants.Title.languagePickerViewTitle)")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                LanguagePickerView()
            }
            .offset(y: 50)
            .zIndex(4.0)
            
            // Continue Button
            VStack {
                Spacer()
                ButtonView(label: "Continue", buttonColor: Color.orange, onTap: {
                    withAnimation(.easeIn(duration: 0.25)){
                        showOnBoardingScreen = true
                    }
                })
                .padding(.bottom, 50)
                
            }
            .zIndex(5.0)
        }
    }
}

// MARK: - Preview
#Preview {
    LanguageSelectionScreen(showOnBoardingScreen: Binding.constant(false))
}
