//
//  NotchScriptApp.swift
//  NotchScript
//
//  Created by Toope Oladunjoye on 6/26/26.
//

import SwiftUI
import DynamicNotchKit

@main
struct NotchScriptApp: App {
    @State var script: String = "Please type your script."
    @State var auto: Bool = false
    @State var playing: Bool = false
    @State var speed: Double = 2.0
    @State var fontSize: Int = 17
    @State var color: Color = .white
    
    var body: some Scene {
        WindowGroup {
            ContentView(script: $script, auto: $auto, playing: $playing, speed: $speed, fontSize: $fontSize, color: $color)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .containerBackground(.ultraThinMaterial, for: .window)
                .onAppear {
                    let notch = DynamicNotch {
                        VStack(alignment: .center) {
                            NotchView(script: $script, auto: $auto, playing: $playing, speed: $speed, fontSize: $fontSize, color: $color)
                        }
                    }
                    Task {
                        await notch.expand()
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
    }
}
