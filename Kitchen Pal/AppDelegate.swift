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
        steak.directions = " "
        
        let crustedChicken = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        crustedChicken.title = "Parmesan Crusted Chicken"
        crustedChicken.directions = " "
        
        let salmon = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        salmon.title = "Grilled Salmon"
        salmon.directions = " "
        
        let tacos = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: self.managedObjectContext) as! Recipes
        tacos.title = "Fish Tacos"
        tacos.directions = " "
        
        
        let steakRelation = steak.mutableSetValueForKeyPath("hasIngredient")
        steakRelation.addObject(beef)
        
        let crustedChickenRelation = crustedChicken.mutableSetValueForKeyPath("hasIngredient")
        crustedChickenRelation.addObject(chicken)
        
        let salmonRelation = salmon.mutableSetValueForKeyPath("hasIngredient")
        salmonRelation.addObject(fish)
        
        let tacosRelation = tacos.mutableSetValueForKeyPath("hasIngredient")
        tacosRelation.addObject(fish)
        tacosRelation.addObject(cheese)
        
        
        self.saveContext()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
                    deleteAllObjects("Ingredients")
                    deleteAllObjects("Recipes")
                    initKitchen()
        //            insertSomeData()
                    showRequestedRecipes("Fish")
                    showExampleData()
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
        var requestedRecipes: [Recipes]? = nil
        let recipesRequest = NSFetchRequest(entityName: "Recipes")
        do {
            let recipes = try self.managedObjectContext.executeFetchRequest(recipesRequest)
            for recipe in recipes as! [Recipes] {
                if recipe == request{
                    requestedRecipes?.append(recipe)
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

