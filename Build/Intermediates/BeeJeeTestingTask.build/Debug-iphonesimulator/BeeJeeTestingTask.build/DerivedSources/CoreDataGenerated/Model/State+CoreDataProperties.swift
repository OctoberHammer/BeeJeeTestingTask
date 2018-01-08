//
//  State+CoreDataProperties.swift
//  
//
//  Created by October Hammer on 1/8/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension State {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<State> {
        return NSFetchRequest<State>(entityName: "State")
    }

    @NSManaged public var title: String?
    @NSManaged public var cities: NSSet?

}

// MARK: Generated accessors for cities
extension State {

    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: City)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: City)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)

}
