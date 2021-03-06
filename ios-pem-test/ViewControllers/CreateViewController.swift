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
    @IBOutlet weak var cvInput: UITextView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    private var ratingValue: String = "0"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ratingLabel.text = ratingValue
    }
    

    @IBAction func onDoneTapped(_ sender: UIBarButtonItem) {
        var data: [String: String] = [:]
        
        let name = nameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let surname = surnameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let age = ageInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let occupation = occupationInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dni = dniInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let cv = cvInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let rating = ratingValue
        
        if name != nil && name != ""
            && surname != nil && surname != ""
            && age != nil && age != ""
            && occupation != nil && occupation != ""
            && dni != nil && dni != ""
            && cv != nil && cv != ""
            && rating != "" {
            
            data["name"] = name
            data["surname"] = surname
            data["age"] = age
            data["occupation"] = occupation
            data["dni"] = dni
            data["cv"] = cv
            data["rating"] = rating
            
            model.addNewContact(data: data) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func selectRating(_ value: Int) {
        self.ratingValue = "\(value)"
        self.ratingLabel.text = ratingValue
    }
    
    @IBAction func starTapped_1(_ sender: UIButton) {
        selectRating(1)
    }
    
    @IBAction func starTapped_2(_ sender: UIButton) {
        selectRating(2)
    }
    
    @IBAction func starTapped_3(_ sender: UIButton) {
        selectRating(3)
    }
    
    @IBAction func starTapped_4(_ sender: UIButton) {
        selectRating(4)
    }
    
    @IBAction func starTapped_5(_ sender: UIButton) {
        selectRating(5)
    }
    
}
