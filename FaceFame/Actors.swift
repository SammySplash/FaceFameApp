//
//  Actors.swift
//  FaceFame
//
//  Created by Ast on 20.03.2025.
//

import Foundation
import UIKit

struct Question {
    let imageActor: UIImage
    let currectAnswer: String
    let answers: [String]
    let help: String
    
    static func getQuestion(count: Int) -> [Question] {
        var questions: [Question] = []
        let keys = Array(DataStore.maleActors.keys)
        let values = Array(DataStore.maleActors.values)
        
        for i in 0..<count {
            let actor = keys[i]
            let image = UIImage(named: actor) ?? UIImage()
            let help = "Играет в фильме '\(values[i])'"
            var wrongAnswers: [String] = []
            
            for _ in 0..<3 {
                if let randomKey = keys.randomElement(),
                   !wrongAnswers.contains(randomKey) && randomKey != actor {
                    wrongAnswers.append(randomKey)
                }
            }
            wrongAnswers.append(actor)
            wrongAnswers.shuffle()
            
            let question = Question(
                imageActor: image,
                currectAnswer: actor,
                answers: wrongAnswers,
                help: help
            )
            questions.append(question)
        }
        return questions
    }
    
}

