//
//  Contact+CoreDataProperties.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var address: Set<Address>?
    @NSManaged public var phoneNumbers: NSSet?

}

// MARK: Generated accessors for address
extension Contact {

    @objc(addAddressObject:)
    @NSManaged public func addToAddress(_ value: Address)

    @objc(removeAddressObject:)
    @NSManaged public func removeFromAddress(_ value: Address)

    @objc(addAddress:)
    @NSManaged public func addToAddress(_ values: Set<Address>)

    @objc(removeAddress:)
    @NSManaged public func removeFromAddress(_ values: Set<Address>)

}

// MARK: Generated accessors for phoneNumbers
extension Contact {

    @objc(addPhoneNumbersObject:)
    @NSManaged public func addToPhoneNumbers(_ value: PhoneNumber)

    @objc(removePhoneNumbersObject:)
    @NSManaged public func removeFromPhoneNumbers(_ value: PhoneNumber)

    @objc(addPhoneNumbers:)
    @NSManaged public func addToPhoneNumbers(_ values: NSSet)

    @objc(removePhoneNumbers:)
    @NSManaged public func removeFromPhoneNumbers(_ values: NSSet)

}
