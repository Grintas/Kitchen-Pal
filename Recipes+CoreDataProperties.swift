//
//  Recipes+CoreDataProperties.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 11/30/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipes {

    @NSManaged var title: String?
    @NSManaged var directions: String?
    @NSManaged var hasIngredient: NSSet?

}
