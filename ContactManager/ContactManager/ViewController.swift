//
//  ViewController.swift
//  ContactManager
//
//  Created by Valentyn Duritsyn on 27.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let service = ContactManagerService()
    private var contacts: [Information] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getContacts { contacts in
            self.contacts = contacts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        cell.nameLabel.text = contacts[indexPath.item].name.first
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(indexPath.item)")
    }
}
