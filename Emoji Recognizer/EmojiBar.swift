//
//  SwiftUIView.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 04.12.2020.
//

import SwiftUI

struct EmojiBar: View {
    @ObservedObject var emojis: EmojiSet = EmojiSet.shared
    var body: some View {
        HStack {
            Spacer()
            ForEach (EmojiSet.shared.emojiArray.sorted(by: { $0.probability > $1.probability})[0..<5]) { emoji in
                EmojiView(emoji)
                Spacer()
            }
        }
    }
}

struct EmojiBar_Previews: PreviewProvider {
    static var previews: some View {
        EmojiBar()
            .previewLayout(.sizeThatFits)
    }
}
