//
//  IngredientToRecipeMappingModal.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 02/12/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation


class IngredientsRequired: Codable {
    var ingredients: [IngredientsRequiredList] = []
    
    private enum CodingKeys: String, CodingKey {
        case ingredients
    }
}

class IngredientsRequiredList: Codable {
    var ingredientName: String?
    var ingredientDescription: String?
    var recipeList : [RecipeCategoryModal] = []
    
    private enum CodingKeys: String, CodingKey {
        case ingredientName
        case ingredientDescription
        case recipeList
    }
}
