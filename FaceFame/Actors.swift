//
//  Actors.swift
//  FaceFame
//
//  Created by Ast on 20.03.2025.
//

import Foundation

struct Question {
    var correctActor: String
    var hint: String
    var options: [String]
    var imageName: String?
    
    static func generate(from dataStore: [String: String]) -> Question? {
        let allActors = Array(dataStore.keys)
        guard let randomActor = allActors.randomElement() else { return nil }
        
        let hint = dataStore[randomActor] ?? "Подсказка отсутствует"
        let wrongActors = allActors.filter { $0 != randomActor }.shuffled().prefix(3)
        let options = ([randomActor] + wrongActors).shuffled()
        let imageName = DataStore.image(for: randomActor)
        
        return Question(correctActor: randomActor, hint: hint, options: options, imageName: imageName)
    }
}
