//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eskil Mossle on 2023-12-15.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
