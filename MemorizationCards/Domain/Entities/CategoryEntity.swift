//
//  CategoryEntity.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 16/12/22.
//

import Foundation

struct CategoryEntity {
    let id: String
    let name: String
    let exercices: [(String, String)]
}

extension CategoryEntity {
    static var mock: Self {
        return CategoryEntity(id: "1", name: "Test", exercices: [("haben", "to have")])
    }
    
    static var mockList: [Self] {
        var result = [CategoryEntity]()
        for i in 0..<10 {
            result.append(CategoryEntity(id: "\(i)", name: "Test \(i)", exercices: [("haben", "to have")]))
        }
        return result
    }
}

