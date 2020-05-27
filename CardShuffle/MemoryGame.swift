//
//  MemoryGame.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent: StringProtocol> {
    
    var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentCompletion: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let cardContent = cardContentCompletion(pairIndex)
            cards.append(Card(id: pairIndex*2, content: cardContent))
            cards.append(Card(id: pairIndex*2+1, content: cardContent))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            assertionFailure("Card chosen in view not found in model.")
            return
        }
        cards[index].isFaceUp.toggle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
