//
//  ContentView.swift
//  join
//
//  Created by Kushagra Sinha on 13/12/23.
//

import SwiftUI
import Lottie

struct ContentView: View {
    
    // Bool to shift from LottieView.swift (Splash Screen)
    // to LanguageSelectionScreen.swift
    @State var showSplashScreen: Bool = true
    @State var closeLanguageSelectionScreen: Bool = false
    // MARK: - Body
    var body: some View {
        VStack {
            if showSplashScreen {
                // showSplashScreen will change to false in 0.25 sec,
                // which is handled in LottieView.swift
                ZStack {
                    Color.orange.opacity(0.1)
                        .ignoresSafeArea()
                    LottieView(showSplashScreen: $showSplashScreen,
                               name: Constants.Lottie.launchScreen)
                    .scaleEffect(CGSize(width: 0.4, height: 0.4))
                }
            } else if closeLanguageSelectionScreen == false{
                // Will appear with easeInOut(1.0 sec) animation
                LanguageSelectionScreen(showOnBoardingScreen: $closeLanguageSelectionScreen)
            }else if closeLanguageSelectionScreen == true{
                OnBoardingScreenView(goBackToLAnguageSelectionScreen: $closeLanguageSelectionScreen)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
