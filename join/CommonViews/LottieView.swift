//
//  LottieView.swift
//  join
//
//  Created by Kushagra Sinha on 13/12/23.
//

import SwiftUI
import Lottie

// MARK: - Lottie View
struct LottieView: UIViewRepresentable {
    
    @Binding var showSplashScreen: Bool
    var name: String
    
    func makeUIView(context: Context) -> LottieAnimationView {
        
        let view = LottieAnimationView(name: name, bundle: Bundle.main)
        
        view.play { completed in
            // Navigate to the select language screen with easeInOut Animation
            withAnimation(.easeIn(duration: 0.25)) {
                showSplashScreen.toggle()
            }
        }
        return view
    }
    
    // The updateUIView function is required by the UIViewRepresentable protocol.
    // It can be left empty if no updates are needed when the view changes.
    // In this case, there are no updates, so the function is empty.
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // No updates needed
    }
}
