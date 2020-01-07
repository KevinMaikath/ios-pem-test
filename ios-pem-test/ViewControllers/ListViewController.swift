//
//  ListViewController.swift
//  ios-pem-test
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 kevinrx25. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    
}


class ListViewController: UITableViewController {
    
    let model: ListModel = ListModel()
    var selectedContact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getContactList {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.getContactsCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        
        let contact = model.contactList[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.surnameLabel.text = contact.surname
        cell.dniLabel.text = contact.dni
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = model.contactList[indexPath.row]
        
        performSegue(withIdentifier: "ListToDetailSegue", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        model.getContactList {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetailSegue" {
            let detailView = segue.destination as! DetailViewController
            detailView.contact = self.selectedContact
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
