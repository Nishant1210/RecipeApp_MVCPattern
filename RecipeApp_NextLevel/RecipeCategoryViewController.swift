//
//  RecipeCategoryViewController.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import UIKit

class RecipeCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataCategory: DataCategory?
    @IBOutlet weak var collectionList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionList.delegate = self
        collectionList.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCategory?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCategories", for: indexPath) as? RecipeCategoryCell else {return UICollectionViewCell() }
        cell.setUI(imageName: dataCategory?.categories[indexPath.row].categoryName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewFrame = view.frame
        let count = dataCategory?.categories.count ?? 1
        let heightOfCell = viewFrame.height/CGFloat(count)
        if heightOfCell > 30 {
             return CGSize(width: UIScreen.main.bounds.width, height: heightOfCell)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: 30.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryToRecipeList", let selectCell = sender as? UICollectionViewCell, let indexPath = collectionList.indexPath(for: selectCell) {
            if let presentedVC = segue.destination as? RecipeListViewController {
                presentedVC.recipeList = (dataCategory?.categories[indexPath.row].categoryList)
            }
        }
    }
}
