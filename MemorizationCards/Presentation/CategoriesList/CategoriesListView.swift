//
//  CategoriesListView.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 12/12/22.
//

import Foundation
import SwiftUI

struct CategoriesListView: View {
    
    // MARK: - Attributes
    
    @StateObject var viewModel: CategoriesListViewModel = CategoriesListViewModel()
    
    // MARK: - Initializers
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(CategoryVDR.mockList) { category in
                    NavigationLink {
                        CardsExerciceView(
                            viewModel: CardsExerciceViewModel(
                                cardsExerciceVDR: .mock
                            )
                        )
                    } label: {
                        CategoryCellView(category: category)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Memorization Cards")
    }
}

// MARK: - Components
private extension CategoriesListView {
    
}
struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesListView()
        }
    }
}

