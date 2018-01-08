//
//  TotalCell.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import UIKit

class TotalCell: UITableViewCell {
  
  @IBOutlet weak var totalLabel: UILabel!

  private var totalInfo: Int = 0 {
    didSet{
        self.totalLabel.text = "\(totalInfo) Contacts"
    }
  }

  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func setup(with totalInfo: Int) {
    self.totalInfo = totalInfo
  }
  
  
}
