//
//  MemoryGame.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: StringProtocol {
    
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardsIndices.count == 1
                ? faceUpCardsIndices.first
                : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
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
        
        if !cards[index].isFaceUp, !cards[index].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                let matched = cards[index].content == cards[potentialMatchIndex].content
                cards[index].isMatched = matched
                cards[potentialMatchIndex].isMatched = matched
                cards[index].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    struct Card: Identifiable, Equatable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
