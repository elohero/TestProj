//
//  Information.swift
//  ContactManager
//
//  Created by Valentyn Duritsyn on 27.01.2023.
//

import Foundation

struct Information: Codable {
    var name: PersonName
    var picture: PersonPicture
    var email: String
}

struct PersonName: Codable {
    var first: String
    var last: String
}

struct PersonPicture: Codable {
    var large: String
}
