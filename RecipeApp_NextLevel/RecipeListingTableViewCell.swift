//
//  RecipeListingTableViewCell.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 29/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation
import UIKit

class RecipeListingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    func  setUpUI(text: String?)  {
        guard let text = text else { return }
        recipeNameLabel.text = text
    }
}
