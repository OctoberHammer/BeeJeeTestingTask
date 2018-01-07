//
//  InitialJsonModel.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import Foundation





struct Contacts: Codable {
  struct InitialJsonModel: Codable {
    var contactID: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var streetAddress1: String
    var streetAddress2: String
    var city: String
    var state: String
    var zipCode: String
  }
  let contacts: [Contacts]
}
