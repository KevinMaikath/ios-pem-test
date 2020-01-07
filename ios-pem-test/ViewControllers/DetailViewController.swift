//
//  DetailViewController.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let model: DetailModel = DetailModel()

    var contact: Contact?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var cvLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var newRatingValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayData()
    }
    
    private func displayData(){
        nameLabel.text = contact!.name
        surnameLabel.text = contact!.surname
        ageLabel.text = "\(contact!.age)"
        occupationLabel.text = contact!.occupation
        dniLabel.text = contact!.dni
        cvLabel.text = contact!.cv
        ratingLabel.text = "\(contact!.rating)"
    }

    @IBAction func onDeleteTapped(_ sender: UIBarButtonItem) {
        model.deleteContact(contact: self.contact!) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func selectRating(_ value: Int){
        newRatingValue = "\(value)"
        ratingLabel.text = newRatingValue
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
    
    @IBAction func saveNewRating(_ sender: UIButton) {
        model.saveNewRating(contact!, newRatingValue) {
            
        }
    }
    
}
