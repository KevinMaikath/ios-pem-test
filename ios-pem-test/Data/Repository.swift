//
//  Repository.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import Foundation
import RealmSwift

class Repository {

    private static var INSTANCE: Repository?
    public var contactList: [Contact]
    private let realm = try! Realm()
    
    init(){
        self.contactList = []
    }
    
    public static func getInstance() -> Repository{
        if INSTANCE == nil {
            INSTANCE = Repository()
        }
        return INSTANCE!
    }
    
    public func loadContactList(completion: @escaping (([Contact]) -> Void)) {
        let contacts = realm.objects(Contact.self)
        self.contactList = []
        for contact in contacts {
            self.contactList.append(contact)
        }
        completion(self.contactList)
    }
    
    public func addNewContact(data: [String: String], completion: @escaping (() -> ())) {
        try! realm.write {
            let contacts = realm.objects(Contact.self)
            let id = contacts.count + 1
            let newContact = Contact()
            newContact.id = id
            newContact.name = data["name"]!
            newContact.surname = data["surname"]!
            newContact.age = Int(data["age"]!)!
            newContact.occupation = data["occupation"]!
            newContact.dni = data["dni"]!
            newContact.cv = data["cv"]!
            newContact.rating = Int(data["rating"]!)!
            realm.add(newContact)
        }
        completion()
    }
    
    public func removeContact(contact: Contact, completion: @escaping (() -> ())) {
        let contacts = realm.objects(Contact.self)
        let contactToDelete = contacts[contact.id - 1]
        
        try! realm.write {
            realm.delete(contactToDelete)
        }
        
        completion()
    }
    
}
