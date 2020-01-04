//
//  CreateViewController.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    private let model: CreateModel = CreateModel()
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var surnameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var occupationInput: UITextField!
    @IBOutlet weak var dniInput: UITextField!
    @IBOutlet weak var cvInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func onDoneTapped(_ sender: UIBarButtonItem) {
        var data: [String: String] = [:]
        
        let name = nameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let surname = surnameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let age = ageInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let occupation = occupationInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dni = dniInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let cv = cvInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name != nil && name != ""
            && surname != nil && surname != ""
            && age != nil && age != ""
            && occupation != nil && occupation != ""
            && dni != nil && dni != ""
            && cv != nil && cv != "" {
            
            data["name"] = nameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            data["surname"] = surnameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            data["age"] = ageInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            data["occupation"] = occupationInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            data["dni"] = dniInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            data["cv"] = cvInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            model.addNewContact(data: data) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
