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
    
    public func addNewContact(data: [String: Any], completion: @escaping (() -> ())) {
        
    }
    
    public func removeContact(data: [String: Any], completion: @escaping (() -> ())) {
        
    }
    
}
