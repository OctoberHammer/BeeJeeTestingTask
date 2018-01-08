//
//  DBInitilizer.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/8/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBInitializer {
  static public var shared = DBInitializer()
  lazy var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
  //MARK: -
  //MARK: Init and Deinit
  private init() {
    
  }
  
  
  //MARK: -
  //MARK: populate database with the content of the JSON file
  public func populateDB() {
    //if let path = Bundle.main.path(forResource: R.exampleOfContact, ofType: "json") {
    if let path = Bundle.main.path(forResource: R.initialJSONFileName, ofType: "json") {
      var initialJSONContacts: [initialJSONContact] = []
      if let container = self.container {
        container.viewContext.automaticallyMergesChangesFromParent = true
        //Child context in the background
        let backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        backgroundContext.parent = container.viewContext
        DispatchQueue.global(qos: .background).async {
          
          do {
            let initialJSON = try String(contentsOfFile: path, encoding: .utf8)
            print(initialJSON)
            let initialData = initialJSON.data(using: .utf8)
            let decoder = JSONDecoder()
            
            initialJSONContacts = (try decoder.decode(InitialJsonContactList.self, from: initialData!)).contacts
            
            for everyJSONContact in initialJSONContacts {
              let _ = ContactCD.findOrCreateItem(matching: everyJSONContact, in: backgroundContext)
            }
            try backgroundContext.save()
            DispatchQueue.main.async{
              // Need to save parent context, in main queue
              (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
          } catch {
            print("☠️  \(error.localizedDescription)")
          }
        }
      }
    }
  }
}












