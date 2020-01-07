//
//  DetailModel.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class DetailModel {
    
    var repository: Repository?
    
    init() {
        self.repository = Repository.getInstance()
    }
    
    public func deleteContact(contact: Contact, completion: @escaping (() -> ())){
        repository?.removeContact(contact: contact, completion: {
            completion()
        })
    }
    
    public func saveNewRating(_ contact: Contact,_ value: String, completion: @escaping (() -> ())){
        repository?.editRating(contact, value, completion: {
            completion()
        })
    }

}
