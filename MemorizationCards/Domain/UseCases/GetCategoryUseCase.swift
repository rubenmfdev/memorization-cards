//
//  GetCategoryUseCase.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation
import Combine

protocol GetCategoriesUseCaseProtocol {
    func execute() -> AnyPublisher<[CategoryEntity], ErrorEntity>
}

final class GetCategoriesUseCase: GetCategoriesUseCaseProtocol {
    
    // MARK: - Attributes
    
    let repository: CategoriesRepository
    
    // MARK: - Intializers
    
    init(
        repository: CategoriesRepository
    ) {
        self.repository = repository
    }

    // MARK: - Exectue
    
    func execute() -> AnyPublisher<[CategoryEntity], ErrorEntity> {
        self.repository.getCategories()
    }
}

private extension GetCategoriesUseCase {
    
}
