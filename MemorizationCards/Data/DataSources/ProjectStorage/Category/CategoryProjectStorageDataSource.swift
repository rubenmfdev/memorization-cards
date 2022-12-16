//
//  CategoryProjectStorageDataSource.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation
import Combine

protocol CategoryProjectStorageDataSourceProtocol {
    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity>
}

final class CategoryProjectStorageDataSource: CategoryProjectStorageDataSourceProtocol {
    
    // MARK: - Attributes
    
    // MARK: - Initializers
    
    // MARK: - Implementation

    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity> {
        Just(CategoryEntity.mockList)
            .setFailureType(to: ErrorEntity.self)
            .eraseToAnyPublisher()
    }
}

private extension CategoryProjectStorageDataSource {
    
}
