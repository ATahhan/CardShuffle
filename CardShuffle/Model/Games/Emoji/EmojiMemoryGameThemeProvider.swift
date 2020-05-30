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
    case food = "Food"
    case plants = "Plants"
    case sports = "Sports"
    case tools = "Tools"
    
    static var randomTheme: EmojiMemoryGameThemeProvider {
        allCases.randomElement() ?? .halloween
    }
    
    var name: String {
        rawValue
    }
    
    var numberOfPairs: MemoryGameNumberOfPairs {
        switch self {
        case .beach:
            return .constant(8)
        default:
            return .random
        }
    }
    
    var emojiList: [String] {
        switch self {
        case .halloween:
            return ["👻", "🥮", "🎃", "🙀", "🔥", "⛓"]
        case .beach:
            return ["🏖", "🐚", "🌊", "🐠", "⛱", "🏊🏻‍♂️", "🩳", "🩱"]
        case .food:
            return ["🧀", "🍖", "🍔", "🍚", "🥗", "🍟", "🥯", "🍰", "🍩", "🍒"]
        case .plants:
            return ["💐", "☘️", "🌳", "🌻", "🍀", "🎋", "🌿", "🌷", "🌸", "🌵"]
        case .sports:
            return ["🏄🏻‍♀️", "🤽🏻‍♀️", "⛹🏿‍♂️", "🥎", "🎱", "⚽️", "🎳", "🥋", "⚾️", "🏈"]
        case .tools:
            return ["🛠", "🔧", "🔨", "🔬", "🪓", "🗜", "⚙️", "🖌"]
        }
    }
    
    var color: Color {
        switch self {
        case .halloween:
            return .orange
        case .beach:
            return .blue
        case .food:
            return .red
        case .plants:
            return .green
        case .sports:
            return .yellow
        case .tools:
            return .gray
        }
    }
    
}
