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
    @Binding var fontSize: Int
    @Binding var color: Color
    
    var body: some View {
        VStack {
            TextEditor(text: $script)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 14))
            ZStack {
                HStack(spacing: 15) {
                    HStack(spacing: 5) {
                        Text("Font size:")
                        TextField("17pt", value: $fontSize, format: .number)
                            .frame(width: 50)
                    }
                    HStack(spacing: 5) {
                        Menu {
                            Button("White") { color = .white }
                            Button("Gray") { color = .gray }
                            Button("Blue") { color = .blue }
                            Button("Red") { color = .red }
                            Button("Pink") { color = .pink }
                            Button("Purple") { color = .purple }
                            Button("Yellow") { color = .yellow }
                            Button("Green") { color = .green }
                        } label: {
                            Label("Text Color", systemImage: "")
                                .foregroundStyle(color)
                        }
                    }
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
                    .disabled(!auto)
                }
                .padding()
            }
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 15))
        }
        .padding()
    }
}
