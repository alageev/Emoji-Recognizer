//
//  ContentView.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {

            CameraViewController()
                .edgesIgnoringSafeArea(.top)
            EmojiBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
