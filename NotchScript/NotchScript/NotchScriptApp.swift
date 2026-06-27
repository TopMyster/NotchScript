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
    var body: some Scene {
        WindowGroup {
            ContentView(script: $script)
                .onAppear {
                    let notch = DynamicNotch {
                        VStack(alignment: .center) {
                            NotchView(script: $script)
                        }
                    }
                    Task {
                        await notch.expand()
                    }
                }
        }
    }
}
