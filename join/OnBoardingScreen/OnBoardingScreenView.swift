//
//  OnBoardingScreenView.swift
//  join
//
//  Created by Kushagra Sinha on 23/12/23.
//

import SwiftUI

struct OnBoardingScreenView: View {
    @Binding var goBackToLAnguageSelectionScreen: Bool
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("On-Boarding \nScreen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        goBackToLAnguageSelectionScreen = false
                    }
                }, label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 70))
                })
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    OnBoardingScreenView(goBackToLAnguageSelectionScreen: Binding.constant(false))
}
