//
//  CategoryCellView.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 12/12/22.
//

import Foundation
import SwiftUI

struct CategoryCellView: View {
    
    // MARK: - Attributes
    
    let category: CategoryVDR
    let cellHeight: Double = 100
    let cornerRadius: Double = 12

    // MARK: - Initializers
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center) {
            Text(category.name)
                .foregroundColor(Color.ui.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: self.cellHeight)
        .background(Color.ui.accentColor)
        .cornerRadius(self.cornerRadius)
    }
}

// MARK: - Components
private extension CategoryCellView {
    
}
struct CategoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryCellView(category: .mock)
        }
    }
}

