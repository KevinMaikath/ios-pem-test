//
//  ListModel.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class ListModel {
    
    var repository: Repository?
    var contactList: [Contact]
    
    init() {
        self.repository = Repository.getInstance()
        self.contactList = []
    }
    
    public func getContactList(completion: @escaping (() -> ())){
        repository?.loadContactList(completion: { (loadedContactList) in
            self.contactList = loadedContactList
            completion()
        })
    }
    
    public func getContactsCount() -> Int {
        return self.contactList.count
    }

}
