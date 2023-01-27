//
//  ContactManagerService.swift
//  ContactManager
//
//  Created by Valentyn Duritsyn on 27.01.2023.
//

import Foundation

class ContactManagerService {
    
    let url = URL(string: "https://randomuser.me/api/?results=10")
    
    func getContacts(_ completion: @escaping (([Information]) -> ())) {
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let information = try? decoder.decode(ResultInformation.self, from: data) {
                completion(information.results)
            }
        }
        task.resume()
    }
}

