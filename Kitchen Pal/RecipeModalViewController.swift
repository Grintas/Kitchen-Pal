//
//  recipeModalViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 12/21/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit

class RecipeModalViewController: UITableViewController {
    var cellTitle: String = ""
    var cellDirections: String = ""
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
   // @IBOutlet weak var recipeDirectionsLabel: UILabel!
    
    @IBAction func closeModalView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        // Do any additional setup after loading the view.
        self.recipeTitleLabel.text = self.cellTitle
        //self.recipeDirectionsLabel.text = self.cellDirections
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //    cell.recipeTitleLabel.text = cellTitle
    //  cell.recipeDirectionsLabel.text = cellDirections
    //  return cell

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
