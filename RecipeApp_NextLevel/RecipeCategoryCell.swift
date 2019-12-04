//
//  RecipeCategoryCell.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 29/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation
import UIKit

class RecipeCategoryCell: UICollectionViewCell {
    @IBOutlet weak var recipeCatImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI(imageName: String?) {
        guard  let name = imageName else { return }
        recipeCatImageView.image = UIImage(named: name)
    }
}

