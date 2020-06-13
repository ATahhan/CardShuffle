//
//  EmojiMemoryGameThemeContract.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 30/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

protocol EmojiMemoryGameThemeContract {
    
    /// Name of the theme, shown as the title of each game
    var name: String { get }
    
    /// Number of pairs of cards shown in each game
    var preferredNumberOfPairs: MemoryGameNumberOfPairs { get }
    
    /// Array of emojis to use with this game theme. Provide at least 10 emojis to ensure nothing is duplicated.
    var emojiList: [String] { get }
    
    /// The prefered color to use with this theme.
    var color: Color { get }
    
}

extension EmojiMemoryGameThemeContract {
    var numberOfPairs: Int {
        min(preferredNumberOfPairs.value, emojiList.count)
    }
}
