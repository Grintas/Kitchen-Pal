//
//  TableViewSuperViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 12/7/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var titles: [Recipes] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        titles = appDelegate.getAllRecipes()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if let cell = sender as! UITableViewCell! {
            if let indexPath = self.tableView.indexPathForCell(cell){
                let resVC = segue.destinationViewController as! RecipeModalViewController
                resVC.cellTitle = self.titles[indexPath.row].title
                resVC.cellDirections = self.titles[indexPath.row].directions
            }
        }
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
