//
//  CategoryProjectStorageDataSource.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation
import Combine
import SwiftCSV

protocol CategoryProjectStorageDataSourceProtocol {
    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity>
}

final class CategoryProjectStorageDataSource: CategoryProjectStorageDataSourceProtocol {
    
    // MARK: - Attributes
    
    // MARK: - Initializers
    
    // MARK: - Implementation

    func getCategories() -> AnyPublisher<[CategoryEntity], ErrorEntity> {
        do {
            var categoryList = [CategoryEntity]()
            for csvName in getCSVNamesList() {
                let csvFile: CSV = try CSV<Named>(url: URL(fileURLWithPath: Bundle.main.path(forResource: csvName, ofType: "csv") ?? ""))
                categoryList.append(createCategoryEntity(with: csvFile, name: csvName))
            }
            return Just(categoryList)
                .setFailureType(to: ErrorEntity.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: ErrorEntity.genericError)
                .eraseToAnyPublisher()
        }
    }
}

private extension CategoryProjectStorageDataSource {
    func getCSVNamesList() -> [String] {
        ["irregular verbs", "animals", "cloths", "colors", "food", "fruits", "professions", "verbs"]
    }
    
    func createCategoryEntity(with csv: CSV<Named>, name: String) -> CategoryEntity {
        return CategoryEntity(id: UUID().uuidString, name: name, exercices: self.rowsToTuple(rows: csv.rows))
    }
    
    func rowsToTuple(rows: [[String: String]]) -> [(String, String)] {
        var tupleList = [(String, String)]()
        for row in rows {
            tupleList.append((row["First"] ?? "", row["Second"] ?? ""))
        }
        return tupleList
    }
}
