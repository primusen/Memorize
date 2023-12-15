//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eskil Mossle on 2023-12-15.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis: [String] = ["💐", "🧸", "💖", "🎀", "🌸", "🐱", "🧶", "🐈", "🥰", "💮", "🩵", "🥺"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
