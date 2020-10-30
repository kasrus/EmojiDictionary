//
//  EmojiCollections.swift
//  EmojiDictionary
//
//  Created by Kasumi Ruslim on 10/30/20.
//

import Foundation

struct EmojiCollections {
    var category: String
    var emoji: [Emoji]
    
    init(category: String, emoji:[Emoji]) {
        self.category = category
        self.emoji = emoji
    }
}
