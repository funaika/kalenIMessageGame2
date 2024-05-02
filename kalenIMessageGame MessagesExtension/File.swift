//
//  File.swift
//  kalenIMessageGame MessagesExtension
//
//  Created by Kalen on 5/3/24.
//

import Foundation

struct Card {
    let id: Int
    var imageName: String
    var isFaceUp: Bool
    var isMatched: Bool
}

class GameLogic {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for pairIndex in 0..<numberOfPairsOfCards {
            let card = Card(id: pairIndex * 2, imageName: "card\(pairIndex)", isFaceUp: false, isMatched: false)
            let matchingCard = Card(id: pairIndex * 2 + 1, imageName: "card\(pairIndex)", isFaceUp: false, isMatched: false)
            cards += [card, matchingCard]
        }
        // Shuffle cards
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].imageName == cards[index].imageName {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or two cards are face up, flip down all cards except the one tapped
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = (flipDownIndex == index)
                }
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
