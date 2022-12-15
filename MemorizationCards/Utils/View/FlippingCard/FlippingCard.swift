//
//  FlippingCard.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 15/12/22.
//

import Foundation
import SwiftUI


struct CardFront<Content> : View where Content : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
//            Image(systemName: "suit.club.fill")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .foregroundColor(.red)
            self.content()
                .frame(width: width, height: height)
                .padding()
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.7))
                .padding()
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .padding()
                .frame(width: width, height: height)

            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue.opacity(0.7))

            Image(systemName: "seal")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)

            Image(systemName: "seal")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue.opacity(0.7))

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}


struct FlippingCard<Content> : View where Content : View {
    
    // MARK: - Attributes
    
    @Binding var isFlipped: Bool
    @Binding var isCardResolved: Bool
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    let width : CGFloat = 200
    let height : CGFloat = 250
    let durationAndDelay : CGFloat = 0.3
    @ViewBuilder var frontContent: () -> Content
    var externalFlipCard: (() -> Void)? = nil
    
    // MARK: - Initializers
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            CardFront(
                width: self.width,
                height: self.height,
                degree: self.$frontDegree,
                content: self.frontContent
            )
            CardBack(
                width: self.width,
                height: self.self.height,
                degree: self.$backDegree
            )
        }.onTapGesture {
            self.flipCard ()
        }.onChange(of: self.isCardResolved) { newValue in
            if newValue {
                self.hideCard()
                self.isCardResolved = false
            }
        }
    }
}

// MARK: - Components
private extension FlippingCard {
    func flipCard () {
        self.externalFlipCard?()
        self.isFlipped = !self.isFlipped
        if self.isFlipped {
            withAnimation(.linear(duration: self.durationAndDelay)) {
                self.backDegree = 90
            }
            withAnimation(.linear(duration: self.durationAndDelay).delay(self.durationAndDelay)){
                self.frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: self.durationAndDelay)) {
                self.frontDegree = -90
            }
            withAnimation(.linear(duration: self.durationAndDelay).delay(self.durationAndDelay)){
                self.backDegree = 0
            }
        }
    }
    
    func hideCard() {
        self.isFlipped = !self.isFlipped
        self.frontDegree = -90
        self.backDegree = 0
    }
}
struct FlippingCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlippingCard(isFlipped: .constant(true), isCardResolved: .constant(false)) {
                Text("Haben - Hatten - haben gehabt")
            }
        }
    }
}

