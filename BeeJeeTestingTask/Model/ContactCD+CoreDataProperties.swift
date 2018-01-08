//
//  ContactCD+CoreDataProperties.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/8/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//
//

import Foundation
import CoreData


extension ContactCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactCD> {
        return NSFetchRequest<ContactCD>(entityName: "ContactCD")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var contactID: UUID
    @NSManaged public var phoneNumber: String?
    @NSManaged public var state: String?
    @NSManaged public var city: String?
    @NSManaged public var zipCode: Int32

}
