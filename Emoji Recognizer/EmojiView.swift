//
//  EmojiView.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 14.12.2020.
//

import SwiftUI

struct EmojiView: View {
    
    let emoji: Emoji
    
    init(_ emoji: Emoji) {
        self.emoji = emoji
    }
    
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = emoji.image
        }) {
            VStack {
                Text("\(emoji.probability, specifier: "%.2f")")
                    .foregroundColor(.primary)
                Text(emoji.image)
                    .font(.largeTitle)
            }
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
//        EmojiView("🌚")
        EmptyView()
    }
}
