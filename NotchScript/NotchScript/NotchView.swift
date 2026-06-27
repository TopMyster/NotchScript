//
//  NotchView.swift
//  NotchScript
//
//  Created by Toope Oladunjoye on 6/26/26.
//

import SwiftUI
internal import Combine

struct NotchView: View {
    @Binding var script: String
    @State private var index: Int = 0
    @Binding var auto: Bool
    @Binding var playing: Bool
    @Binding var speed: Double
    var body: some View {
        let formatedScript = script.isEmpty ? ["Please enter your script."] : script.components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        let timer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
        
        ZStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(Array(formatedScript.enumerated()), id: \.offset) { offset, line in
                            Text(line)
                                .font(.title2.bold())
                                .frame(width: 200, height: 50)
                                .id(offset)
                                .opacity(index == offset ? 1.0 : 0.5)
                        }
                    }
                }
                .focusable()
                .focusEffectDisabled()
                .frame(width: 200, height: 50)
                .onChange(of: index) { _, newIndex in
                    proxy.scrollTo(newIndex, anchor: .center)
                }
                .onKeyPress(.space) {
                    if index < (formatedScript.count - 1) {
                        withAnimation {
                            index += 1
                        }
                        return .handled
                    }
                    return .ignored
                }
                .onKeyPress(.leftArrow) {
                    if index > 0 {
                        withAnimation {
                            index -= 1
                        }
                        return .handled
                    }
                    return .ignored
                }
                .onReceive(timer) { _ in
                    if auto && playing {
                        if index < (formatedScript.count - 1) {
                            withAnimation {
                                index += 1
                            }
                        }
                    }
                }
            }
        }
    }
}

