//
//  TableViewSuperViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 12/7/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit

class BrowseRecipesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var titles: [Recipes] = []
    var dataController = ModelDataController()
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        titles = dataController.getAllRecipes()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAddRecipeVC(sender: UIButton) {
       
        let addRecipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addRecipeVC") as! AddRecipeViewController
        addRecipeVC.callbackForClose = {
            self.titles = self.dataController.getAllRecipes()
            self.tableView.reloadData()
        }
        self.presentViewController(addRecipeVC, animated: true, completion: nil)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! RecipeCell
        cell.recipeName.text = titles[indexPath.row].title
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier == "showRecipeDirectionsSegue" {
            if let cell = sender as! UITableViewCell! {
                if let indexPath = self.tableView.indexPathForCell(cell){
                    let resVC = segue.destinationViewController as! FinalModalViewController
                    resVC.cellTitle = self.titles[indexPath.row].title
                    resVC.cellDirections = self.titles[indexPath.row].directions
                }
            }
        }
         self.tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: false)
        
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
