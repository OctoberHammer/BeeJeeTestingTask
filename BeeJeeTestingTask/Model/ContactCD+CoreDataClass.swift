//
//  ContactCD+CoreDataClass.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/8/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ContactCD)
public class ContactCD: NSManagedObject {
  
  static func findOrCreateItem(matching jsonmodel: initialJSONContact, in context: NSManagedObjectContext) -> ContactCD? {
    
    let request: NSFetchRequest<ContactCD>  = ContactCD.fetchRequest()
    request.predicate = NSPredicate(format: "contactID == %@", jsonmodel.ContactID ?? "")
    do {
      let matches = try context.fetch(request)
      if matches.count > 0 {
        assert(matches.count == 1, "Contact has to be unique with this given uuid \(jsonmodel.ContactID)")
        guard let existingContact = matches.first, let uuid = UUID(uuidString: jsonmodel.ContactID ?? "") else {
          return nil
        }
        existingContact.firstName = jsonmodel.firstName ?? ""
        existingContact.lastName = jsonmodel.lastName ?? ""
        existingContact.contactID = uuid
        existingContact.phoneNumber = jsonmodel.phoneNumber
        existingContact.city = jsonmodel.city
        existingContact.state = jsonmodel.state
        existingContact.zipCode = Int32(jsonmodel.zipCode) ?? 10000
        return existingContact
      }
    } catch {
      return nil
    }
    let newContact = ContactCD(context: context)
 
    //guard let uuid = UUID(uuidString: jsonmodel.ContactID ?? "") else {return nil}

    let uuid = UUID(uuidString: jsonmodel.ContactID ?? "") ?? UUID()
    newContact.firstName = jsonmodel.firstName ?? ""
    newContact.lastName = jsonmodel.lastName ?? ""
    newContact.contactID = uuid
    newContact.phoneNumber = jsonmodel.phoneNumber
    newContact.city = jsonmodel.city
    newContact.state = jsonmodel.state
    newContact.zipCode = Int32(jsonmodel.zipCode) ?? 10000
    
    return newContact
  }
}
