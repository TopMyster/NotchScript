//
//  NotchView.swift
//  NotchScript
//
//  Created by Toope Oladunjoye on 6/26/26.
//

import SwiftUI

struct NotchView: View {
    @Binding var script: String
    @State private var index: Int = 0
    var body: some View {
        let formatedScript = script.isEmpty ? ["Please enter your script."] : script.components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        ZStack {
            Text(formatedScript[index])
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200, maxHeight: 50)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Group {
                Button("Next") {
                    if index < (formatedScript.count - 1) {
                        withAnimation {
                            index += 1
                        }
                    } else {
                        index = index
                    }
                }
                .opacity(0)
                .keyboardShortcut(.space, modifiers: [])
                
                Button("Back") {
                    if index > 0 {
                        withAnimation {
                            index -= 1
                        }
                    } else {
                        index = index
                    }
                }
                .opacity(0)
                .keyboardShortcut(.delete, modifiers: [])
            }
            .hidden()
        }
    }
}

