//
//  CategoryVDR.swift
//  MemorizationCards (iOS)
//
//  Created by Ruben Marquez on 13/12/22.
//

import Foundation
import SwiftUI

struct CategoryVDR: Identifiable {
    let id = UUID()
    var name: String
    let entity: CategoryEntity
}

extension CategoryVDR {
    static var mock: Self {
        return CategoryVDR(name: "Test", entity: .mock)
    }
    
    static var mockList: [Self] {
        var result = [CategoryVDR]()
        for i in 0..<10 {
            result.append(CategoryVDR(name: "\(i) Test", entity: .mock))
        }
        return result
    }
}

extension CategoryVDR {
    static func fromEntity(_ entity: CategoryEntity) -> CategoryVDR {
        CategoryVDR(name: entity.name, entity: entity)
    }
}
