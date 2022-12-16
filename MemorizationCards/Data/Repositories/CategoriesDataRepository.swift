//
//  CategoriesDataRepository.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation
import Combine

final class CategoriesDataRepository: CategoriesRepository {
    
    // MARK: - Attributes
    
    let categoryProjectStorageDataSource: CategoryProjectStorageDataSourceProtocol
    
    // MARK: - Intializers
    
    init(
        categoryProjectStorageDataSource: CategoryProjectStorageDataSourceProtocol
    ) {
        self.categoryProjectStorageDataSource = categoryProjectStorageDataSource
    }
    
    // MARK: - Repository
    
    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity> {
        self.categoryProjectStorageDataSource.getCategories()
    }
}

private extension CategoriesDataRepository {
    
}
