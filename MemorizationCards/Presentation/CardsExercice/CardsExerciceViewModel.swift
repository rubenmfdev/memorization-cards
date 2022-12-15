//
//  CardsExerciceViewModel.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 12/12/22.
//

import Foundation
import Combine

final class CardsExerciceViewModel: ObservableObject {
    
    // MARK: - State
    
    @Published var isFlipped = false
    @Published var isCardResolved = false
    @Published var wrongCount = 0
    @Published var correctCount = 0
    @Published var currentCard: (String, String) = ("", "")
    
    // MARK: - Attributes
    
    let cardsExerciceVDR: CardsExerciceVDR
    var cardsExerciceQueue = Queue<(String, String)>()
    
    // MARK: - Initializers
    
    init(
        cardsExerciceVDR: CardsExerciceVDR
    ) {
        self.cardsExerciceVDR = cardsExerciceVDR
        self.setupQueue()
    }
    
}

// MARK: - Public methods
extension CardsExerciceViewModel {
    func wrongPressed() {
        self.wrongCount += 1
        self.nextCard()
    }
    
    func correctPressed() {
        self.correctCount += 1
        self.nextCard()
    }
}

// MARK: - Private methods
private extension CardsExerciceViewModel {
    func setupQueue() {
        for cardExercice in self.cardsExerciceVDR.items {
            self.cardsExerciceQueue.enqueue(cardExercice)
        }
        if let nextCard = self.cardsExerciceQueue.dequeue() {
            self.currentCard = nextCard
        }
    }
    
    func nextCard() {
        if let nextCard = self.cardsExerciceQueue.dequeue() {
            self.currentCard = nextCard
            self.isCardResolved = true
        } else {
            self.endExercice()
        }
    }
    
    func endExercice() {
        self.currentCard = ("DONE!", self.getEndExerciceMessage())
    }
    
    func getEndExerciceMessage() -> String {
        "Correct: \(self.correctCount) \n Wrong: \(self.wrongCount)"
    }
}

// MARK: - Dependency injection
extension CardsExerciceViewModel {
    //    convenience init() {
    //
    //    }
}
