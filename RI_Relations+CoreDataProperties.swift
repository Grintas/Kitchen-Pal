//
//  RI_Relations+CoreDataProperties.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 11/23/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RI_Relations {

    @NSManaged var ingredientName: String?
    @NSManaged var recipeTitle: String?
    @NSManaged var hasIngredients: Ingredients?
    @NSManaged var isInRecipes: Recipes?

}
