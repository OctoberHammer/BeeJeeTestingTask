//
//  InitialJsonModel.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import Foundation


struct initialJSONContact: Codable {
  var ContactID: String?
  var firstName: String?
  var lastName: String?
  var phoneNumber: String?
  var streetAddress1: String?
  var streetAddress2: String?
  var city: String?
  var state: String?
  var zipCode: String = "10000"
}


struct InitialJsonContactList: Codable {
  var contacts: [initialJSONContact]
}
