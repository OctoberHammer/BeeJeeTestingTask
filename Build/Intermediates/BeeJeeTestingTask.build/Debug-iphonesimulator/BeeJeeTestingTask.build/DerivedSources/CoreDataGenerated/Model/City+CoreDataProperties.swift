//
//  City+CoreDataProperties.swift
//  
//
//  Created by October Hammer on 1/8/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var title: String?
    @NSManaged public var state: State?

}
