//
//  RecipeModalViewTableCell.swift
//  Kitchen Pal
//
//  Created by Grintas Junevičius on 12/21/15.
//  Copyright © 2015 Grintas Junevičius. All rights reserved.
//

import UIKit

class RecipeModalViewTableCell: UITableViewCell {

    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeDirectionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
