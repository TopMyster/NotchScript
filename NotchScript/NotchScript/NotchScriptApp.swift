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
    @State var script: String = ""
    @State var auto: Bool = false
    @State var playing: Bool = false
    @State var speed: Double = 3.0
    var body: some Scene {
        WindowGroup {
            ContentView(script: $script, auto: $auto, playing: $playing, speed: $speed)
                .onAppear {
                    let notch = DynamicNotch {
                        VStack(alignment: .center) {
                            NotchView(script: $script, auto: $auto, playing: $playing, speed: $speed)
                        }
                    }
                    Task {
                        await notch.expand()
                    }
                }
        }
    }
}
