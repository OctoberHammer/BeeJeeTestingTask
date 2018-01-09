//
//  CreatingContact.swift
//  BeeJeeTestingTask
//
//  Created by October Hammer on 1/9/18.
//  Copyright © 2018 October Hammer. All rights reserved.
//

import UIKit
import CoreData

class CreatingContactVC: UIViewController {

  lazy var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
  
  @IBOutlet weak var firstNameTF: UITextField!
  @IBOutlet weak var street1TF: UITextField!
  
  @IBOutlet weak var phoneNumberTF: UITextField!
  @IBOutlet weak var zipCodeTF: UITextField!
  @IBOutlet weak var street2TF: UITextField!
  @IBOutlet weak var cityTF: UITextField!
  @IBOutlet weak var stateTF: UITextField!
  @IBOutlet weak var lastNameTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func createTapped(_ sender: UIBarButtonItem) {
    let newContact = initialJSONContact(ContactID: UUID().uuidString, firstName: self.firstNameTF.text ?? "", lastName: self.lastNameTF.text ?? "", phoneNumber: self.phoneNumberTF.text ?? "", streetAddress1: self.street1TF.text ?? "", streetAddress2: self.street2TF.text ?? "", city: self.cityTF.text ?? "", state: self.stateTF.text ?? "", zipCode: self.zipCodeTF.text ?? "10000")
    if let container = self.container {
      let _ = ContactCD.findOrCreateItem(matching: newContact, in: container.viewContext)
      try? container.viewContext.save()
      navigationController?.popViewController(animated: true)
    }
  }
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
