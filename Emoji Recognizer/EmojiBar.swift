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
            ForEach (emojis.emojiArray.sorted(by: { $0.probability > $1.probability})[0..<5], id: \.image) { emoji in
                Text(emoji.image)
                    .font(.largeTitle)
            }
        }
//        .onChange(of: emojis.$emojiArray[0], perform: {print($0)})
        .background (
        RoundedRectangle(cornerRadius: 500, style: .continuous)
            .background(Color.white))
            .padding()
    }
}

struct EmojiBar_Previews: PreviewProvider {
    static var previews: some View {
        EmojiBar()
            .previewLayout(.sizeThatFits)
    }
}
