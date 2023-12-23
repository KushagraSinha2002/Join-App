//
//  LanguagePickerView.swift
//  join
//
//  Created by Kushagra Sinha on 13/12/23.
//

import SwiftUI

struct LanguagePickerView: View {
    
    @State private var showingBottomSheetView = false // Tracks the visibility of the bottom sheet
    @State private var englishSelected: Bool = true // Tracks whether English is selected or not
    @State private var isDonePressed: Bool = false // Tracks whether the done button is pressed
    @State var lastSelectedLanguage: String = Constants.Language.english // Stores the last selected language
    
    var body: some View {
        ZStack {
            // RoundedRectangle with white stroke
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.01))
                    .overlay(
                        // Adjust the corner radius as needed
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .frame(width: 275, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            // Default Language: English
            if isDonePressed {
                withAnimation(.easeInOut(duration: 0.25)) {
                    Text(englishSelected ? "\(Constants.Language.english)" : "\(Constants.Language.arabic)")
                        .frame(width: 275, height: 50)
                        .foregroundStyle(Color.white)
                }
            } else {
                withAnimation(.easeInOut(duration: 0.25)) {
                    Text("\(lastSelectedLanguage)")
                        .foregroundStyle(Color.white)
                }
            }
        }
        .onTapGesture {
            showingBottomSheetView.toggle()
            if isDonePressed {
                withAnimation(.easeInOut(duration: 0.25)) {
                    isDonePressed = false
                }
                lastSelectedLanguage = englishSelected ? Constants.Language.english : Constants.Language.arabic
            }
        }
        .sheet(isPresented: $showingBottomSheetView) {
            LanguageSelectorBottomSheet(showingBottomSheet: $showingBottomSheetView,
                                        englishSelected: $englishSelected,
                                        isDonePressed: $isDonePressed,
                                        lastSelectedLanguage: lastSelectedLanguage)
            .presentationDetents([.height(200)])
        }
    }
}

// MARK: - Preview
#Preview {
    LanguagePickerView()
}
