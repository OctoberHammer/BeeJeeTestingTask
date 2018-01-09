# BeeJeeTestingTask


## Sample Application

The purpose of this exercise is to just see how your coding style is and to gauge your current knowledge of iOS app development.
Since the project itself is not as important as how it is implemented letís just go with a simple Contacts application based on the requirements below.

(At this point we do not want you wasting your time dealing with requirements that you are not familiar with yet.
For example, if you do not know Core Data then skip that requirement implement it as you know how to.
Keep in mind the purpose of this exercise is for me to determine what your current skill level so we can have a better idea of what expectations will be.)

### Data Model

The application will start with 10 contacts in a JSON file that is parsed and imported into Core Data. 
Each contact will have the attributes defined in the table below. 
These attributes are just a guideline of the required information, how the data model is organized is up to you to decide.
Just be prepared to discuss your design decisions.

### (UI you can see it on UI-image.jpeg)
![UI you can see it on UI-image.jpg](https://github.com/OctoberHammer/BeeJeeTestingTask/blob/dev/UI-image.jpg "UI you can see it on UI-image.jpeg")


For the UI just model it after the built in iOS Contactís application from Apple. 
The user must have the ability to display the list of Contacts as well as add, update, and delete a contact.
We're not looking for a 100% feature complete application here, just trying to see your thought process
in the implementation. We are not concerned about field validation, etc. because all of that is easy to
implemented so there is no need to waste time making sure everything is complete.
But we will test that we can at least add, update, and delete a contact.

### If you have a question about whether to implement some element, please email us.

P.S. there is already a Contacts app in our product. Itís not a ìcode this for usî exercise.

Good luck!



# IMPLEMENTATION

https://youtu.be/Mp_Kkb6OjG4

1. I used **Codable** prototol to parse from JSON
2. Special class with singleton for initial populating the Local DB
3. Simple and stritforward model with only one entity (In the real world application I would use different entity for **phoneNumber**, **addres**(would include state, city, streetAddress and zipCode), **city** and **state**; moreover, state and city would link with one-tomany relation, and so for contact and phoneNumber, contact and address - because a person can have more than one phoneNumber)
4. I use **NSFetchedResultsController** for synchronization my UI (ContactListTVC) with core data. Basically used MVC-pattern
5. Different ViewController for editing/creating contact - in the real application perhapse I would implement two different controllers, both of them would inherit from **TableViewController** with the cell for every field
6. Deleting is also implemented in contact list VC
8. The whole implementation with some experiments tooks me 8 hours.
