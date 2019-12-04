//
//  RecipeIngredientsListCell.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 28/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation
import UIKit

class RecipeIngredientsListCell: UITableViewCell {
    
    @IBOutlet weak var ingredientItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func  setUpUI(text: String?)  {
        guard let text = text else { return }
        ingredientItemLabel.text = text
    }
}
