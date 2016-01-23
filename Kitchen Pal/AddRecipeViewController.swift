//
//  AddRecipeViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 1/23/16.
//  Copyright © 2016 Grintas Junevičius. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var directionsTextView: UITextView!
    @IBOutlet weak var recipeTitleField: UITextField!
    
    var callbackForClose: (() -> Void)?
    let dataController = ModelDataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //directionsTextView.t
        // Do any additional setup after loading the view.
    }

    @IBAction func closeModalWindow(sender: AnyObject) {
        let newRecipe = NSEntityDescription.insertNewObjectForEntityForName("Recipes", inManagedObjectContext: dataController.managedObjectContext) as! Recipes
        newRecipe.title = recipeTitleField.text!
        newRecipe.directions = directionsTextView.text
        dataController.saveContext()
        callbackForClose!()
        dataController.showExampleData()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        directionsTextView.becomeFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
