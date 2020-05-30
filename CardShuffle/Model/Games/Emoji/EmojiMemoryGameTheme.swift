//
//  EmojiMemoryGameThemeProvider.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 30/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

enum EmojiMemoryGameThemeProvider: String, CaseIterable, EmojiMemoryGameThemeContract {
    
    case halloween = "Halloween"
    case beach = "Beach"
    
    static var randomGame: EmojiMemoryGameThemeProvider {
        allCases.randomElement() ?? .halloween
    }
    
    var name: String {
        rawValue
    }
    
    var numberOfPairs: MemoryGameNumberOfPairs {
        switch self {
        case .halloween:
            return .random
        case .beach:
            return .constant(8)
        }
    }
    
    var emojiList: [String] {
        switch self {
        case .halloween:
            return ["👻", "🥮", "🎃", "🙀", "🔥", "⛓"]
        case .beach:
            return ["🏖", "🐚", "🌊", "🐠", "⛱", "🏊🏻‍♂️", "🩳", "🩱"]
        }
    }
    
    var color: Color {
        switch self {
        case .halloween:
            return .orange
        case .beach:
            return .blue
        }
    }
    
}
