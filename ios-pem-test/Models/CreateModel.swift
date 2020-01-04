//
//  CreateModel.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class CreateModel {
    
    var repository: Repository?
    
    init() {
        self.repository = Repository.getInstance()
    }
    
    public func addNewContact(data: [String: String], completion: @escaping (() -> ())){
        repository?.addNewContact(data: data, completion: {
            completion()
        })
    }

}
