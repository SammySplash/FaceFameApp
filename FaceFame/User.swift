//
//  User.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 30/03/2025.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static let user = User(
        login: "1",
        password: "1",
        person: .person
    )
}

struct Person {
    let name: String
    let surname: String
    let photo: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static let person = Person(
        name: "Михаил",
        surname: "Альбертович",
        photo: "Image 3"
    )
}
