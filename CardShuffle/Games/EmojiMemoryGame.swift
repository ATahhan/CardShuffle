//
//  EmojiMemoryGame.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = createEmojiGame()
    
    static func createEmojiGame() -> MemoryGame<String> {
        let emojis = ["☕️", "🍨", "🥮"]
        return MemoryGame<String>(numberOfPairs: emojis.count) { (index) -> String in
            emojis[index]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
