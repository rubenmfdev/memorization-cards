//
//  CardsExerciceVDR.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 15/12/22.
//

import Foundation
import SwiftUI

struct CardsExerciceVDR: Identifiable {
    let id = UUID()
    var items: [(String, String)]
}

extension CardsExerciceVDR {
    static var mock: Self {
        return CardsExerciceVDR(
            items: [
                ("sind", "to be"),
                ("haben", "to have"),
                ("fahren", "to drive"),
                ("spielen", "to play"),
                ("kochen", "to cock"),
                ("backen", "to backe"),
            ]
        )
    }
}
