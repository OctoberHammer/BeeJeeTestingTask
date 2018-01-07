//
//  State+CoreDataProperties.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//
//

import Foundation
import CoreData


extension State {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<State> {
        return NSFetchRequest<State>(entityName: "State")
    }

    @NSManaged public var title: String?
    @NSManaged public var cities: Set<City>?

}

// MARK: Generated accessors for cities
extension State {

    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: City)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: City)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: Set<City>)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: Set<City>)

}
