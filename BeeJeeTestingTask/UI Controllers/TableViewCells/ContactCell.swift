//
//  ContactCell.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import UIKit
import CoreData

class ContactCell: UITableViewCell {
  
  struct ViewModel {
    var represetation: NSAttributedString
    init(with contact: ContactCD) {
      let firstNameAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)]
      let lastNameAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17)]
      let partOne = NSMutableAttributedString(string: "\(contact.firstName)", attributes: firstNameAttributes)
      let partTwo = NSMutableAttributedString(string: " \(contact.lastName)", attributes: lastNameAttributes)

      partOne.append(partTwo)
      self.represetation = partOne
    }
  }
  
  
  @IBOutlet weak var contactRepresentationLbl: UILabel!
  
  
  private var contactRepresentation: ContactCell.ViewModel? {didSet{
      self.contactRepresentationLbl.attributedText = self.contactRepresentation?.represetation
    }
  }
  
  private var contact: ContactCD? {
    didSet{
      guard let contact = self.contact else  { return }
      self.contactRepresentation = ContactCell.ViewModel(with: contact)
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
  
  func setup(with contact:ContactCD) {
    self.contact = contact
    self.contactRepresentation = ContactCell.ViewModel(with: contact)
  }
  
}
