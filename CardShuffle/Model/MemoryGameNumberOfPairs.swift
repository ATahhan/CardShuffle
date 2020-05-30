//
//  MemoryGameNumberOfPairs.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 30/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import Foundation

/// Defines the number of pairs of cards per memory game
enum MemoryGameNumberOfPairs {
    /// returns a random number between 2 and 10 pairs
    case random
    /// constant number of pairs
    case constant(Int)
    
    var value: Int {
        switch self {
        case .random:
            return (2...10).randomElement() ?? 5
        case .constant(let constant):
            return constant
        }
    }
}
