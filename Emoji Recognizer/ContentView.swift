//
//  ContentView.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CameraViewController()
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
