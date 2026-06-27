//
//  ContentView.swift
//  NotchScript
//
//  Created by Toope Oladunjoye on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var script: String
    var body: some View {
        VStack {
            TextEditor(text: $script)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
}
