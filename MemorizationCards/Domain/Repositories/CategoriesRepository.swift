//
//  CategoriesRepository.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation
import Combine

protocol CategoriesRepository {
    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity>
}
