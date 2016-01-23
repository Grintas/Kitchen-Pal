//
//  QuickSearchCollectionViewController.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 12/14/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit

private let reuseIdentifier = "prototypeCellIdentifier"

class QuickSearchCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var buttonTitles: [Ingredients] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataController = ModelDataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        buttonTitles = dataController.getAllIngredients()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if buttonTitles.count == 0 {
            buttonTitles = dataController.getAllIngredients()
        }
        return buttonTitles.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.ingredientButton.setTitle(buttonTitles[indexPath.row].name, forState: .Normal)
        // Configure the cel
        
        return cell
    }

//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        self.indexPath = indexPath
//        self.selectedItem = self.buttonTitles[indexPath.item].name
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as! CollectionViewCell! {
            if let indexPath = collectionView.indexPathForCell(cell) {
                let selectedItem = self.buttonTitles[indexPath.item].name
                let resVC = segue.destinationViewController as! ResultsTableViewController
                resVC.selectedItem = selectedItem;
            }
        }
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
