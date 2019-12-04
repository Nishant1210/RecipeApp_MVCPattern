//
//  RecipeDescriptionViewController.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import UIKit
import SafariServices

class RecipeDescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var descriptionOfRecipe: UITextView!
    @IBOutlet weak var ingredientsList: UITableView!
    @IBOutlet weak var valueOfPreparationTime: UILabel!
    @IBOutlet weak var titleOfRecipe: UILabel!
    var deliciousrecipe : RecipeDescriptionModal?
    var ingredientToRecipeList: IngredientsRequired?
    var indexValue: Int = 0
    weak var listParent: RecipeListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsList.dataSource = self
        ingredientsList.delegate = self
        descriptionOfRecipe.text = deliciousrecipe?.description
        valueOfPreparationTime.text = deliciousrecipe?.preparationTime
        titleOfRecipe.text = deliciousrecipe?.title
        recipeImage.image = UIImage(named: "paneer-butter-masala")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliciousrecipe?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientListCell") as? RecipeIngredientsListCell else { return UITableViewCell() }
        cell.setUpUI(text: deliciousrecipe?.ingredients[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexValue = indexPath.row
        ingredientToRecipeList = AppDelegate.getDataFromIngredientRecipeMappingJsonJSON(filename: "IngredientRecipeMapping")
        if let parentVC = self.listParent, let ingredientCell = tableView.cellForRow(at: indexPath) as? RecipeIngredientsListCell, let ingredientName = ingredientCell.ingredientItemLabel.text {
            parentVC.comingFromIngredients = true
            parentVC.ingredientsRequiredList = searchListOfRecipesOnIngredientName(ingredientName: ingredientName)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func watchVideosAction(_ sender: Any) {
        let videoUrl = URL(string: deliciousrecipe?.recipeLink! ?? "www.youtube.com")
        let safariVC = SFSafariViewController(url: videoUrl!)
        present(safariVC, animated: true, completion: nil)
    }
    
    func searchListOfRecipesOnIngredientName(ingredientName: String) -> IngredientsRequiredList? {
        if let ingredientsName = ingredientToRecipeList?.ingredients, let indexValue = ingredientsName.firstIndex(where: {$0.ingredientName == ingredientName}) {
            return ingredientsName[indexValue]
        }
        return nil
    }
}
