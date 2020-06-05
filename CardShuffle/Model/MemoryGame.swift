//
//  MemoryGame.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: StringProtocol {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
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
    
    private(set) var isPlaying: Bool
    
    private(set) var score: Int = 0
    
    init(numberOfPairs: Int, cardContentCompletion: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let cardContent = cardContentCompletion(pairIndex)
            cards.append(Card(id: pairIndex*2, content: cardContent))
            cards.append(Card(id: pairIndex*2+1, content: cardContent))
        }
        cards.shuffle()
        isPlaying = true
    }
    
    mutating func choose(card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            assertionFailure("Card chosen in view not found in model.")
            return
        }
        
        if !cards[index].isFaceUp, !cards[index].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                let isMatched = cards[index].content == cards[potentialMatchIndex].content
                cards[potentialMatchIndex].isMatched = isMatched
                cards[index].isMatched = isMatched
                cards[index].isFaceUp = true
                
                updateScore(firstMatchIndex: potentialMatchIndex, secondMatchIndex: index)
                
                if cards.first(where: { !$0.isMatched }) == nil {
                    finishGame()
                }
                
                cards[potentialMatchIndex].isSeen = true
                cards[index].isSeen = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    private mutating func updateScore(firstMatchIndex: Int, secondMatchIndex: Int) {
        let isCorrect = cards[firstMatchIndex].content == cards[secondMatchIndex].content
        // Subtracts 1 per unseen card
        let subtractAmount = [cards[firstMatchIndex], cards[secondMatchIndex]].map(\.isSeen).reduce(0, { $1 ? $0 + 1 : $0 })
        score = isCorrect ? score + 2 : max(score - subtractAmount, 0)
    }
    
    private mutating func finishGame() {
        isPlaying = false
    }
    
    struct Card: Identifiable, Equatable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
    }
    
}
