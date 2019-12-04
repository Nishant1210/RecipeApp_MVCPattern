//
//  RecipeListViewController.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipeList: [RecipeCategoryModal]?
    var comingFromIngredients: Bool = false
    var recipeDescriptionList: RecipesListDescription?
    var ingredientsRequiredList: IngredientsRequiredList?
    
    @IBOutlet weak var recipeListTableView: UITableView!
    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var ingredientDescription: UILabel!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeListTableView.delegate = self
        recipeListTableView.dataSource = self
        recipeDescriptionList = AppDelegate.getIngredientsFromRecipeDescriptionJSON(filename: "RecipeDescription")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !comingFromIngredients {
            ingredientImageView.isHidden = true
            ingredientDescription.isHidden = true
            tableViewTopConstraint.priority = UILayoutPriority(999)
        } else {
            ingredientImageView.isHidden = false
            ingredientDescription.isHidden = false
            tableViewTopConstraint.priority = UILayoutPriority(751)
            updateUI()
            recipeListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !comingFromIngredients {
            return recipeList?.count ?? 0
        } else {
            return ingredientsRequiredList?.recipeList.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeListingCell") as? RecipeListingTableViewCell else {return UITableViewCell()}
        if !comingFromIngredients {
            cell.setUpUI(text: recipeList?[indexPath.row].recipeName)
        } else {
            cell.setUpUI(text: ingredientsRequiredList?.recipeList[indexPath.row].recipeName)
        }
        return cell
    }
    
    private func searchRecipeId(recipeID: String) -> RecipeDescriptionModal? {
        if let recipes = recipeDescriptionList?.Recipes, let indexValue = recipes.firstIndex(where: {$0.id == recipeID}) {
            return recipes[indexValue]
        }
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDeccriptionSegue", let recipeDescriptionVC = segue.destination as? RecipeDescriptionViewController,let selectCell = sender as? UITableViewCell, let indexPath = recipeListTableView.indexPath(for: selectCell) {
            recipeDescriptionVC.listParent = self
            recipeDescriptionVC.deliciousrecipe = searchRecipeId(recipeID: recipeList?[indexPath.row].id ?? "0001")
        }
    }
    
    func updateUI(){
        ingredientDescription.text = ingredientsRequiredList?.ingredientName
        ingredientImageView.image = UIImage(named: (ingredientsRequiredList?.ingredientName) ?? "")
         recipeList = ingredientsRequiredList?.recipeList
        
    }
}
