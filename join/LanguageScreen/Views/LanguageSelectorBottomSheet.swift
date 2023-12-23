//
//  LonguageSelectorBottomSheet.swift
//  join
//
//  Created by Kushagra Sinha on 19/12/23.
//

import SwiftUI

struct LanguageSelectorBottomSheet: View {
    @Binding var showingBottomSheet: Bool
    @Binding var englishSelected: Bool
    @Binding var isDonePressed: Bool
    @State var lastSelectedLanguage: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.appBackground)
            
            VStack {
                // Picker View
                VStack(spacing: 50) {
                    header // Header: Cancel, Done
                    chooseLanguageList // Supported Language List: English, Arabic
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Additional VStack for adding Spacer at the bottom
                Spacer()
            }
        }
        .onAppear(perform: {
            // If the user selects a different language, presses the cancel button,
            // and then opens the LanguageSelector View again,
            // the last language selected with confirmation by the user or
            // the default language option (English) will be shown if previously no choice is made.
            if lastSelectedLanguage == Constants.Language.english {
                englishSelected = true
            } else {
                englishSelected = false
            }
        })
    }
}

extension LanguageSelectorBottomSheet {
    
    private var header: some View {
        // Header
        HStack {
            // Cancel Button
            Button(action: {
                showingBottomSheet.toggle() // Close Bottom Sheet
            }, label: {
                Text("Cancel")
                    .foregroundStyle(Color.appText)
            })
            
            Spacer()
            
            // Done Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.25)) {
                    isDonePressed = true
                }
                showingBottomSheet.toggle() // Close Bottom Sheet
            }, label: {
                Text("Done")
                    .foregroundStyle(Color.teal)
            })
        }
        .font(.headline)
        .fontWeight(.regular)

    }
    
    private var chooseLanguageList: some View {
        VStack(spacing: 40) {
            // Arabic (ar)
            Button(action: {
                englishSelected = false
            }, label: {
                HStack {
                    Text("\(Constants.Language.arabic)")
                        .foregroundStyle(Color.appText)
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(!englishSelected ? Color.teal : Color.gray.opacity(0.5))
                        .font(.system(size: 25))
                }
            })
            .shadow(color: !englishSelected ? Color.appText.opacity(0.2) : Color.clear, radius: 8, x: 0, y: 8)
            
            // English (en)
            Button(action: {
                englishSelected = true
            }, label: {
                HStack {
                    Text("\(Constants.Language.english)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.appText)
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(englishSelected ? Color.teal : Color.gray.opacity(0.5))
                        .font(.system(size: 25))
                }
            })
            .shadow(color: englishSelected ? Color.appText.opacity(0.2) : Color.clear, radius: 8, x: 0, y: 8)

        }
    }
}

// MARK: - Preview
#Preview {
    LanguageSelectorBottomSheet(showingBottomSheet: Binding.constant(false), englishSelected: Binding.constant(true),                                         isDonePressed: Binding.constant(false), lastSelectedLanguage: Constants.Language.english)
}
