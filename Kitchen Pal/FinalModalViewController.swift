//
//  FinalModalViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 1/22/16.
//  Copyright © 2016 Grintas Junevičius. All rights reserved.
//

import UIKit

class FinalModalViewController: UIViewController {
    var cellTitle: String = ""
    var cellDirections: String = ""

    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeDirectionsTextView: UITextView!
    
    @IBAction func closeModalView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.recipeTitleLabel.text = self.cellTitle
        self.recipeDirectionsTextView.text = self.cellDirections
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
