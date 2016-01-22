//
//  AppDelegate.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 11/23/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func deleteAllObjects(entityName: String) {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        do {
            let objects = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            
            for object in objects as! [NSManagedObject] {
                self.managedObjectContext.deleteObject(object)
            }
            
            try self.managedObjectContext.save()
        } catch let error as NSError {
            print("Error deleting \(entityName) - error:\(error)")
        }
    }

    func initKitchen() {
        let pork = NSEntityDescription.insertNewObjectForEntityForName("Ingredients",
            inManagedObjectContext: self.managedObjectContext) as! Ingredients
        pork.name = "Pork"
        
        let beef = NSEntityDescription.insertNewObjectForEntityForName("Ingredients",
            inManagedObjectContext: self.managedObjectContext) as! Ingredients
        beef.name = "Beef"
        
        let chicken = NSEntityDescription.insertNewObjectForEntityForName("Ingredients",
            inManagedObjectContext: self.managedObjectContext) as! Ingredients
        chicken.name = "Chicken"
        
        let fish = NSEntityDescription.insertNewObjectForEntityForName("Ingredients",
            inManagedObjectContext: self.managedObjectContext) as! Ingredients
        fish.name = "Fish"
        
        let cheese = NSEntityDescription.insertNewObjectForEntityForName("Ingredients", inManagedObjectContext: self.managedObjectContext) as! Ingredients
        cheese.name = "Cheese"
        
        
        let steak = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        steak.title = "The Beef Steak"
        steak.directions = "Directions for steak:  This is some text \n" +
        "over multiple lines"
        
        let crustedChicken = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        crustedChicken.title = "Parmesan Crusted Chicken"
        crustedChicken.directions =  "Ingredients\n\n" +
        
        "1 1/2 to 2 pounds fingerling potatoes or red skin baby potatoes\n" +
        "1 small red bell pepper, seeded and cut into thin strips\n" +
        "1 Italian mild green pepper, cubanelle, seeded and thinly sliced\n" +
        "1 medium yellow skinned onion, thinly sliced\n" +
        "4 large cloves garlic, cracked away from skin\n" +
        "1 teaspoon crushed red pepper flakes\n" +
        "1/4 cup tablespoons extra-virgin olive oil, divided\n" +
        "Coarse salt and pepper\n" +
        "2 cups shredded Parmesan, available in tubs near deli -- make sure to get shredded cheese, not grated\n" +
        "4 (6 to 8-ounce) boneless, skinless chicken breasts\n" +
        "4 plum Roma tomatoes or small, vine ripe tomatoes, seeded and chopped\n" +
        "15 to 20 leaves fresh basil, pile leaves, roll then thinly slice -- chiffonade\n\n" +
        "Directions\n\n" +
        
        "Preheat oven to 500 degrees F.\n" +
        
        "Cut fingerling potatoes into halves or quarters, depending on thickness of fingerlings -- thin, small fingerlings may also be left hole, larger potatoes should be quartered to speed cooking process. If you are using small red potatoes, halve or quarter them in the same way.\n" +
        
        "Cover a large cookie sheet with foil. Place potatoes on cookie sheet. Combine with peppers and onions, garlic and crushed red pepper flakes. Coat the potatoes, peppers and onions with extra-virgin olive oil just enough to coat vegetables in a thin layer, 2 to 3 tablespoons. Season liberally with salt and pepper. Place potatoes in the oven and roast 20 to 22 minutes, until potatoes are just tender and peppers and onions are crisp at edges. Toss mixture with tongs, turning the potatoes after 15 minutes. When the potatoes are cooked, transfer them to a serving dish and peel the foil off the cookie sheet and discard for super-quick clean up!\n" +
        
        "While potatoes cook, prepare chicken. Roll out a 2-foot piece of waxed paper or foil near the stove top. Heat a large nonstick skillet over medium high heat -- your pan must be very hot when the chicken is added. Pile the shredded cheese on the work surface created with the waxed paper or foil. Season your chicken breasts with black pepper but no salt; the cheese will add enough salt to the taste of the dish. Press the breasts firmly into the cheese. Coat both sides of breasts with as much cheese as possible. Add 1 tablespoon extra-virgin olive oil to the skillet, 1 turn of the pan. Set breasts into the skillet and cook 7 minutes on each side, until cheese forms an even, golden casing around the tender chicken breasts.\n" +
        
        "While chicken cooks, combine chopped tomatoes with basil in a small bowl. Season with salt and pepper, to your taste.\n" +
        
        "Drain off any excess oil from chicken as you remove it from the skillet. Top chicken with big spoonfuls of raw sauce and serve with potatoes, peppers and onions."
        
        let salmon = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        salmon.title = "Sweet and Spicy Grilled Salmon"
        salmon.directions =  "Ingredients\n\n" +
        
        "2 tablespoons hot sauce, such as Frank's\n" +
        "1 tablespoon packed dark brown sugar\n" +
        "1 teaspoon smoked paprika\n" +
        "1/4 teaspoon cayenne pepper\n" +
        "2 tablespoons light mayonnaise\n" +
        "1 tablespoon snipped chives\n"
        "8 stalks celery, very thinly sliced in half moons on an angle\n" +
        "1/2 small red onion, very thinly sliced\n" +
        "Four 5-ounce center-cut skin-on salmon fillets, about 1 inch thick\n" +
        "Kosher salt and freshly ground black pepper\n" +
        "Vegetable oil, for oiling the grill\n\n" +
        "Directions\n" +
        
        "Preheat an outdoor grill or grill pan on medium high.\n" +
        
        "Mix together the hot sauce, brown sugar, paprika and cayenne in a small bowl. Transfer 1 tablespoon of the mixture to a large bowl and whisk in the mayonnaise; set aside the rest of the sauce. Add the chives, celery and onions to the bowl with the mayonnaise and toss well.\n" +
        
        "Sprinkle the salmon with salt and pepper. Brush the grill grate lightly with oil. Lay the salmon on the grill, skin-side up, and cook until distinct grill marks appear and the salmon releases easily from the grate, 2 to 3 minutes. Turn and brush the fish with some of the reserved sauce. Continue to cook the fish, brushing the pieces periodically with the sauce, until the salmon fillets are glazed and just cooked through, 13 to 15 minutes more.\n" +
        
        "Transfer the fillets to individual plates and serve with the celery slaw."
        
        let tacos = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        tacos.title = "Fish Tacos"
        tacos.directions =  "Ingredients\n\n" +
        
        "Tacos:\n" +
        "1 pound white flaky fish, such as mahi mahi or orata\n" +
        "1/4 cup canola oil\n" +
        "1 lime, juiced\n" +
        "1 tablespoons ancho chili powder\n" +
        "1 jalapeno, coarsely chopped\n" +
        "1/4 cup chopped fresh cilantro leaves\n" +
        "8 flour tortillas\n\n" +
        "Garnish:\n" +
        "Shredded white cabbage\n" +
        "Hot sauce\n" +
        "Crema or sour cream\n" +
        "Thinly sliced red onion\n" +
        "Thinly sliced green onion\n" +
        "Chopped cilantro leaves\n" +
        "Pureed Tomato Salsa, recipe follows\n" +
        "Pureed Tomato Salsa:\n" +
        "2 tablespoon peanut oil\n" +
        "1 small red onion, coarsely chopped\n" +
        "4 cloves garlic, coarsely chopped\n" +
        "4 large ripe tomatoes, chopped\n" +
        "1 serrano chile\n" +
        "1 jalapeno, sliced\n" +
        "1 tablespoon chipotle hot sauce\n" +
        "1 tablespoon Mexican oregano\n" +
        "1/4 cup chopped fresh cilantro leaves\n" +
        "Salt and pepper\n\n" +
        "Directions\n" +
        
        "Garnish:\n" +
        "Preheat grill to medium-high heat. Place fish in a medium size dish. Whisk together the oil, lime juice, ancho, jalapeno, and cilantro and pour over the fish. Let marinate for 15 to 20 minutes.\n" +
        
        "Remove the fish from the marinade place onto a hot grill, flesh side down. Grill the fish for 4 minutes on the first side and then flip for 30 seconds and remove. Let rest for 5 minutes then flake the fish with a fork.\n" +
        
        "Place the tortillas on the grill and grill for 20 seconds. Divide the fish among the tortillas and garnish with any or all of the garnishes.\n\n" +
        
        "Pureed Tomato Salsa:\n" +
        "Preheat grill or use side burners of the grill. Heat oil in medium saucepan, add onions and garlic and cook until soft. Add tomatoes, serrano and jalapeno and cook until tomatoes are soft, about 15 to 20 minutes. Puree the mixture with a hand-held immersion blender until smooth and cook for an additional 10 to 15 minutes. Add the hot sauce, oregano, cilantro and lime juice and season with salt and pepper, to taste. Yield: 6 to 8 servings\n"
        
        let waffles = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        waffles.title = "Fried Chicken and Waffle Cones"
        waffles.directions = "Serves: 8 \n \n" +
        
        "Waffle Cones:\n" +
        
        "2 eggs \n" +
        "1/2 cup white sugar \n" +
        "1/4 cup butter, melted and cooled \n" +
        "3 tablespoons milk \n" +
        "1/4 teaspoon ground cinnamon \n" +
        "1/2 teaspoon vanilla extract \n" +
        "1/3 cup all-purpose flour \n" +
        "1/8 teaspoon salt \n" +
        "3 tablespoons vegetable oil \n \n" +
        
        "Fried Chicken: \n" +
        
        "1 pound of chicken, diced into bite-sized pieces \n" +
        "1 cup buttermilk \n" +
        "1 cup bread crumbs \n" +
        "2 cups all purpose flour, for dredging \n" +
        "2 teaspoon garlic powder \n" +
        "1 teaspoon paprika \n" +
        "1 teaspoon ground black pepper \n" +
        "1/2 teaspoon onion powder \n" +
        "1/2 teaspoon cayenne \n" +
        "1/2 teaspoon red pepper flakes \n" +
        "2 quarts vegetable oil, for frying \n \n" +
            
        "Mashed Potatoes: \n" +
        
        "Follow any Garlic Mashed Potatoes recipe from Better Homes and Gardens \n" +
        
        "For the Waffle Cones: \n" +
        
        "Form or find a cone shape in any size you prefer. I used wadded tin foil, but bottles, or whatever cone-like object you have on hand will work just as well. \n" +
        "Whisk the eggs and sugar together until frothy, then gradually add the butter, milk, vanilla, and cinnamon. In tablespoon increments, incorporate flour and salt. The resulting batter should be really thin (more runny than pancake batter). \n" +
        "If you have a pizelle iron, now is the time to bust it out. If not, a skillet will work too, you’ll just be without the waffle pattern. Brush whatever skillet you’re using with oil and pour 1/8 cup of the batter onto it. Cook until both sides are golden brown, flipping often. Once it’s finished, wrap the unformed cone around whatever object you’ve acquired to form the cone shape. Allow to cool completely before removing from object. Repeat to use up batter. \n \n" +
            
        "For the Fried Chicken: \n" +
        
        "Place diced chicken in a bowl, top with spices and buttermilk, and toss to coat. Add bread crumbs and flour and toss again until pieces are separated and evenly coated. \n" +
        "Pour oil into a medium saucepan over medium heat and fry chicken pieces 4 minutes, or until golden brown. Using a slotted spoon, remove chicken from oil and drain on a drying rack. \n \n" +
        "To assemble: \n" +
        
        "Fill each waffle cone with 1/4 cup mashed potatoes and sprinkle with fried chicken bites. \n" +
        "Drizzle with maple syrup and enjoy!"
        
        let steakRelation = steak.mutableSetValueForKeyPath("hasIngredient")
        steakRelation.addObject(beef)
        
        let crustedChickenRelation = crustedChicken.mutableSetValueForKeyPath("hasIngredient")
        crustedChickenRelation.addObject(chicken)
        crustedChickenRelation.addObject(cheese)
        
        let salmonRelation = salmon.mutableSetValueForKeyPath("hasIngredient")
        salmonRelation.addObject(fish)
        
        let tacosRelation = tacos.mutableSetValueForKeyPath("hasIngredient")
        tacosRelation.addObject(fish)
        tacosRelation.addObject(cheese)
        
        let wafflesRelation = waffles.mutableSetValueForKeyPath("hasIngredient")
        wafflesRelation.addObject(chicken)
        
        self.saveContext()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
                    deleteAllObjects("Ingredients")
                    deleteAllObjects("Recipes")
                    initKitchen()
        //            insertSomeData()
                    //showRequestedRecipes("Fish")
                    //showExampleData()
        // Override point for customization after application launch.
        return true
    }
    
    func showRequestedRecipes(request: String){
        let ingredientRequest = NSFetchRequest(entityName: "Ingredients")
        // let requestedName = "Fish"
        do {
            let ingredients = try self.managedObjectContext.executeFetchRequest(ingredientRequest)
            for ingredient in ingredients as! [Ingredients] {
                print("Recipes for ingredient: \(ingredient.name)")
                let recipes = ingredient.valueForKey("isInRecipe") as! NSSet
                for recipe in recipes {
                    print("Title: \(recipe.title as String)")
                }
            }
            
            
            // if let fetchedRecipes = try self.managedObjectContext.executeFetchRequest(recipesRequest) as! [Recipes]
            // recipesRequest.predicate = NSPredicate(format: "requestedName == %@", requestedName)
        } catch let error as NSError {
            print("Error fetching: \(error)")
        }
    }
    
    func getRequestedRecipes(request: String) -> [Recipes]?{
        var requestedRecipes: [Recipes] = []
        let recipesRequest = NSFetchRequest(entityName: "Recipes")
        do {
            let recipes = try self.managedObjectContext.executeFetchRequest(recipesRequest)
            for recipe in recipes as! [Recipes] {
                let ingredients = recipe.valueForKey("hasIngredient") as! NSSet
                for ingredient in ingredients{
                    if ingredient.name == request{
                        print(ingredient.name)
                        requestedRecipes.append(recipe)
                    }
                }
            }
        } catch let error as NSError {
            print("Error fetching: \(error)")
        }
        
        return requestedRecipes
    }
    
    func showExampleData() {
        
        let recipesRequest = NSFetchRequest(entityName: "Recipes")
        do {
            let recipes = try self.managedObjectContext.executeFetchRequest(recipesRequest)
            for recipe in recipes as! [Recipes] {
                print("Ingredients for recipe: \(recipe.title)")
                let ingredients = recipe.valueForKey("hasIngredient") as! NSSet
                for ingredient in ingredients {
                    print("Name: \(ingredient.name)")
                    
                }
            }
        } catch let error as NSError {
            print("Error fetching: \(error)")
        }
    }
    
    func getAllIngredients()->[Ingredients]{
        var allIngredients = [Ingredients]()
        let ingredientsRequest = NSFetchRequest(entityName: "Ingredients")
        do{
            let ingredients = try self.managedObjectContext.executeFetchRequest(ingredientsRequest)
            for ingredient in ingredients as! [Ingredients]{
                allIngredients.append(ingredient)
            }
        }
        catch {
            
        }
        return allIngredients
    }
    
    func getAllRecipes()->[Recipes]{
        var allRecipes = [Recipes]()
        let recipesRequest = NSFetchRequest(entityName: "Recipes")
        do{
            let recipes = try self.managedObjectContext.executeFetchRequest(recipesRequest)
            for recipe in recipes as! [Recipes]{
                allRecipes.append(recipe)
            }
        }
        catch{
            
        }
        return allRecipes
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "Grintas.Kitchen_Pal" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Kitchen_Pal", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

