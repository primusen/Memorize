//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Eskil Mossle on 2023-12-15.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(.red)
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Button("Shuffle") {
                    withAnimation {
                        viewModel.shuffle()
                    }
                }
            }
            .foregroundColor(.red)
            .font(.title)
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundColor(Color.pink)
    }
}
    

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
