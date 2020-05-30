//
//  EmojiMemoryGame.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>!
    
    var themeProvider: EmojiMemoryGameThemeContract!
    
    /// Creates a game with a random theme
    init() {
        generateRandomNewGame()
    }
    
    /// Creates a game using the given theme
    /// - Parameter theme: Emoji game theme to use
    init(themeProvider: EmojiMemoryGameThemeContract) {
        self.themeProvider = themeProvider
        let emojis = themeProvider.emojiList
        let randomNumberOfPairs = themeProvider.numberOfPairs.value
        
        model = MemoryGame<String>(numberOfPairs: randomNumberOfPairs) { (index) -> String in
            emojis[index % emojis.count]
        }
    }
    
    private func generateRandomNewGame() {
        themeProvider = EmojiMemoryGameThemeProvider.allCases.randomElement() ?? .halloween
        let emojis = themeProvider.emojiList
        let randomNumberOfPairs = themeProvider.numberOfPairs.value
        
        model = MemoryGame<String>(numberOfPairs: randomNumberOfPairs) { (index) -> String in
            emojis[index % emojis.count]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var currentScore: Int {
        model.score
    }
    
    var isPlaying: Bool {
        model.isPlaying
    }
    
    var title: String {
        themeProvider.name
    }
    
    var color: Color {
        themeProvider.color
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func startNewGame() {
        generateRandomNewGame()
    }
    
}
