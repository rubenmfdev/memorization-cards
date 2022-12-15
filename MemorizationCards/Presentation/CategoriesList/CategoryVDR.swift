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
}

extension CategoryVDR {
    static var mock: Self {
        return CategoryVDR(name: "Test")
    }
    
    static var mockList: [Self] {
        var result = [CategoryVDR]()
        for i in 0..<10 {
            result.append(CategoryVDR(name: "\(i) Test"))
        }
        return result
    }
}
