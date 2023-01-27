//
//  ViewController.swift
//  ContactManager
//
//  Created by Valentyn Duritsyn on 27.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let url = URL(string: "https://randomuser.me/api/?results=10")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let information = try? decoder.decode(ResultInformation.self, from: data) {
                print(information)
                for i in information.results {
                    print("NAME: \(i.name.first) \(i.name.last)")
                }
            }
        }
        task.resume()
    }
}
