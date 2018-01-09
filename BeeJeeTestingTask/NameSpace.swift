//
//  NameSpace.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import Foundation


struct R {
  enum Cells: String {
    case cell, total, fieldCell
  }
  
  enum Segues: String {
    case edit, create
  }
  
  static let initialJSONFileName: String = "contacts"
  static let exampleOfContact: String = "contact"

  enum entities: String{
    case ContactCD
  }
  
  
  enum visibleFields: String {
    case firstName, lastName, city, state, phoneNumber, zipCode
  }
}
