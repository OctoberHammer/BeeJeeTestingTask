//
//  Address+CoreDataProperties.swift
//  
//
//  Created by October Hammer on 1/8/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var streetAddress1: String?
    @NSManaged public var streetAddress2: String?
    @NSManaged public var zipCode: Int32
    @NSManaged public var city: City?
    @NSManaged public var contacts: Contact?

}
