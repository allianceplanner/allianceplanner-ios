//
//  RequirementViewCell.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/21/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit

class RequirementTableViewCell : UITableViewCell {
    
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconView: UIView!
    @IBOutlet var lineView: UIView!
    @IBOutlet var iconImageView: UIImageView!
    
    
    var requirement : Requirement?

    
}

extension RequirementTableViewCell {

    func adapt (indexPath: NSIndexPath) -> RequirementTableViewCell {
    
        self.requirement = Requirement()
        self.requirement?.urgency = indexPath.row
        
        self.titleLabel.text = "\(indexPath.row)"
        self.iconImageView.layer.borderWidth = 0
        self.iconImageView.layer.masksToBounds = false
        self.iconImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.iconImageView.layer.cornerRadius = 5
        self.iconImageView.clipsToBounds = true
        
        if self.requirement?.urgency == 1 {
            self.iconImageView.backgroundColor = UIColor(netHex:0xD997F1)
        }
        else if self.requirement?.urgency == 2 {
            self.iconImageView.backgroundColor = UIColor(netHex:0x5AE29D)
        }
        else if self.requirement?.urgency == 3 {
            self.iconImageView.backgroundColor = UIColor(netHex:0x4DC2FF)
        }
        else if self.requirement?.urgency == 4 {
            self.iconImageView.backgroundColor = UIColor(netHex:0xFFC06F)
        }
        
        if(indexPath.item % 2 == 0)
        {
            self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        }
        else
        {
            self.backgroundColor = UIColor.blackColor()
                .colorWithAlphaComponent(0.2)
            self.textLabel?.backgroundColor = UIColor.whiteColor()
                .colorWithAlphaComponent(0.0)
        }
        
        return self
    }
}
