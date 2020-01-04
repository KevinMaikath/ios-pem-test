//
//  Contact.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var occupation: String = ""
    @objc dynamic var dni: String = ""
    @objc dynamic var cv: String = ""
    
}
