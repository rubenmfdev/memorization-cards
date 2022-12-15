//
//  CardsExerciceView.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 12/12/22.
//

import Foundation
import SwiftUI

struct CardsExerciceView: View {
    
    // MARK: - Attributes
    
    @ObservedObject var viewModel: CardsExerciceViewModel
    let durationAndDelay : CGFloat = 0.3
    let imageSize: Double = 40
    
    // MARK: - Initializers
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(self.viewModel.currentCard.0)
            FlippingCard(
                isFlipped: self.$viewModel.isFlipped,
                isCardResolved: self.$viewModel.isCardResolved
            ) {
                Text(self.viewModel.currentCard.1)
            }
            .padding(.bottom, 60)
            HStack {
                Spacer()
                Button {
                    self.viewModel.wrongPressed()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                }
                .frame(
                    width: self.imageSize,
                    height: self.imageSize
                )
                Spacer()
                Spacer()
                Button {
                    self.viewModel.correctPressed()
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                }
                .frame(
                    width: self.imageSize,
                    height: self.imageSize
                )
                Spacer()
            }
            .opacity(self.viewModel.isFlipped ? 1: 0)
        }
    }
}

// MARK: - View Components
private extension CardsExerciceView {

}

struct CardsExerciceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsExerciceView(
                viewModel: CardsExerciceViewModel(
                    cardsExerciceVDR: .mock
                )
            )
        }
    }
}

