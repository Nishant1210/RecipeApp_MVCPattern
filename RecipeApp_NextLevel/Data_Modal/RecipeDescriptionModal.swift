//
//  RecipeDescriptionModal.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation

class RecipeDescriptionModal: Codable {
    var id: String?
    var title: String?
    var ingredients: [String] = []
    var preparationTime: String?
    var description: String?
    var recipeLink: String?
    //var imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case ingredients
        case preparationTime = "preptime"
        case description
        case recipeLink = "url"
    }
}

class RecipesListDescription: Codable {
    var Recipes: [RecipeDescriptionModal] = []
}
