//
//  ContentView.swift
//  NotchScript
//
//  Created by Toope Oladunjoye on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var script: String
    @Binding var auto: Bool
    @Binding var playing: Bool
    @Binding var speed: Double
    var body: some View {
        VStack {
            TextEditor(text: $script)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack(spacing: 15) {
                Toggle("Enable auto", isOn: $auto)
                Group {
                    Button(playing ? "Pause" : "Play") {
                        playing.toggle()
                    }
                    VStack(spacing: 5) {
                        Slider(value: $speed, in: 1...10, step: 1)

                        Text("1 - 10 Seconds")
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(auto ? false : true)
            }
        }
        .padding()
    }
}
