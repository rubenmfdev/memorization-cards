//
//  CategoriesListViewModel.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 12/12/22.
//

import Foundation
import Combine

final class CategoriesListViewModel: ObservableObject {
    
    // MARK: - State
    
    @Published var categories: [CategoryVDR] = []
    
    // MARK: - Attributes
    
    private var cancellables = Set<AnyCancellable>()
    let getCategoriesUseCase: GetCategoriesUseCaseProtocol
    
    // MARK: - Initializers
    
    init(
        getCategoriesUseCase: GetCategoriesUseCaseProtocol
    ) {
        self.getCategoriesUseCase = getCategoriesUseCase
        self.loadData()
    }
    
}

// MARK: - Public methods
extension CategoriesListViewModel {
    func getCardExercice(category: CategoryEntity) -> CardsExerciceVDR {
        CardsExerciceVDR(items: category.exercices)
    }
}

// MARK: - Private methods
private extension CategoriesListViewModel {
    func loadData() {
        let cancellable = self.getCategoriesUseCase.execute()
            .sink { [weak self] result in
                // TODO
            } receiveValue: { categoryList in
                for category in categoryList {
                    self.categories.append(CategoryVDR.fromEntity(category))
                }
            }
        self.cancellables.insert(cancellable)
    }
}

// MARK: - Dependency injection
extension CategoriesListViewModel {
        convenience init() {
            let categoryProjectStorageDataSource: CategoryProjectStorageDataSourceProtocol = CategoryProjectStorageDataSource()
            let categoriesRepository: CategoriesRepository = CategoriesDataRepository(categoryProjectStorageDataSource: categoryProjectStorageDataSource)
            let getCategoriesUseCase: GetCategoriesUseCaseProtocol = GetCategoriesUseCase(repository: categoriesRepository)
            self.init(getCategoriesUseCase: getCategoriesUseCase)
        }
}
