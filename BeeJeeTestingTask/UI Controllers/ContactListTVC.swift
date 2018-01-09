 //
//  ContactListTVC.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/7/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import UIKit
import CoreData

class ContactListTVC: UITableViewController, NSFetchedResultsControllerDelegate {

  var dataSource: [initialJSONContact] = []
  var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
  var indexOfContacts = [String]()
  
  lazy var fetchedResultController: NSFetchedResultsController<ContactCD>? = {

    if let context = self.container?.viewContext {
      let fetchRequest = NSFetchRequest<ContactCD>(entityName: "ContactCD")
      fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true)]
      let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
      frc.delegate = self
      return frc
    } else {
      return nil
    }
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DBInitializer.shared.populateDB()
    

    
    do {
      try self.fetchedResultController?.performFetch()
      print("🎾 \(self.fetchedResultController?.fetchedObjects?.count ?? 0)")
    } catch let err {
      print(err.localizedDescription)
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return (self.fetchedResultController?.fetchedObjects?.count ?? 0) + 1
  }
  


  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let totalAmount = self.fetchedResultController?.fetchedObjects?.count ?? 0
    if indexPath.row < totalAmount {
      let cell = tableView.dequeueReusableCell(withIdentifier: R.Cells.cell.rawValue, for: indexPath) as! ContactCell
      if let contact = self.fetchedResultController?.object(at: indexPath) {
        //cell.setup(with: contact)
        print(contact.contactID)
        cell.setup(with: contact)
      }
      // Configure the cell...
      
      return cell}
    else {
      let cell = tableView.dequeueReusableCell(withIdentifier: R.Cells.total.rawValue, for: indexPath) as! TotalCell
      // Configure the cell...
      //let totalAmount = 0
      cell.setup(with: totalAmount)
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath)
  }
  

  //MARK: -
  // MARK: NSFetchedResultsControllerDelegate methods
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    self.tableView.beginUpdates()
  }
  
 
  
  func controller(
    _ controller: NSFetchedResultsController<NSFetchRequestResult>,
    didChange anObject: Any,
    at indexPath: IndexPath?,
    for type: NSFetchedResultsChangeType,
    newIndexPath: IndexPath?) {
    print("Changing object...")
    switch type {
    case .insert:
      if let insertIndexPath = newIndexPath {
        self.tableView.insertRows(at: [insertIndexPath], with: .fade)
      }
    case .delete:
      if let deleteIndexPath = indexPath {
        self.tableView.deleteRows(at: [deleteIndexPath], with: .fade)
      }
    case .update:
      if let updateIndexPath = indexPath {
        let cell = self.tableView.cellForRow(at: updateIndexPath as IndexPath) as! ContactCell
        if let contact = self.fetchedResultController?.object(at: updateIndexPath as IndexPath) {
          cell.setup(with: contact)
        }
      }
    case .move:
      if let deleteIndexPath = indexPath {
        self.tableView.deleteRows(at: [deleteIndexPath], with: .fade)
      }
      if let insertIndexPath = newIndexPath {
        self.tableView.insertRows(at: [insertIndexPath], with: .fade)
      }
    }
  }
  
//  func controller(
//    _ controller: NSFetchedResultsController<NSFetchRequestResult>,
//    didChange sectionInfo: NSFetchedResultsSectionInfo,
//    atSectionIndex sectionIndex: Int,
//    for type: NSFetchedResultsChangeType) {
//    print("Changing section....")
//
//  }
  
  
  
  public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
    return sectionName
  }
  
  public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    self.tableView.endUpdates()
  }
  
  
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    let totalAmount = self.fetchedResultController?.fetchedObjects?.count ?? 0
    if indexPath.row < totalAmount {
      return true
    } else {
      return false
    }
  }
  
  
  
  
  
  
  
  
   // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // Delete the row from the data source
      let selectedRow = indexPath.row
      if let context = self.container?.viewContext, let contactToDelete = self.fetchedResultController?.fetchedObjects?[selectedRow]  {
        context.delete(contactToDelete)
        try? context.save()
        //tableView.deleteRows(at: [indexPath], with: .fade)
      }
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
  
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == R.Segues.edit.rawValue {
      if let indexPath = tableView.indexPathForSelectedRow{
        let selectedRow = indexPath.row
        let editVC = segue.destination as! CreatingContactVC
        editVC.contactToEdit = self.fetchedResultController?.fetchedObjects?[selectedRow]
        //detailVC.park = self.parksArray[selectedRow]
      }
    }
  }
  
  
  
 }
