//
//  RecipeCategoryModal.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 29/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation

class RecipeCategoryModal: Codable {
    var id: String?
    var recipeName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case recipeName = "name"
    }
}

class Category: Codable {
    var categoryName: String?
    var categoryList : [RecipeCategoryModal] = []
    
    private enum CodingKeys: String, CodingKey {
        case categoryName
        case categoryList
    }
}

class DataCategory: Codable {
    var categories: [Category] = []
    
    private enum CodingKeys: String, CodingKey {
        case categories
    }
}
