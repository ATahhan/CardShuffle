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
        let emojis = ["☕️", "🍨", "🥮", "🍫", "🍯"]
        let randomNumberOfPairs = (2...emojis.count).randomElement() ?? 2
        
        return MemoryGame<String>(numberOfPairs: randomNumberOfPairs) { (index) -> String in
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
