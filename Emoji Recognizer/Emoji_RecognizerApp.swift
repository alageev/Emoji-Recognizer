//
//  Emoji_RecognizerApp.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import SwiftUI
import ARKit

@main
struct Emoji_RecognizerApp: App {
    

    
    init() {
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("This app requires iOS 14 and an iOS device with a front TrueDepth camera")
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
