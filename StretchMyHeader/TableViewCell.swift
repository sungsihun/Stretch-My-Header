//
//  TableViewCell.swift
//  StretchMyHeader
//
//  Created by NICE on 2018-09-11.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var headlineLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
