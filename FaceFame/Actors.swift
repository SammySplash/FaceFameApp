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
    let correctAnswer: String
    let answers: [String]
    let help: String
    
    static func getQuestion(count: Int, theme: String) -> [Question] {
        
        var questions: [Question] = []
        var actors = [DataStore.maleActors]
        
        if theme == "female" {
            actors = [DataStore.femaleActors]
        } else {
            actors = [DataStore.maleActors]
        }
        
        let keys = Array(actors.shuffled()[0].keys)
        let values = Array(actors.shuffled()[0].values)
        
        for i in 0..<count {
            let actor = keys[i]
            let image = UIImage(named: actor)
            let help = values[i]
            var wrongAnswers: [String] = []
            
            while wrongAnswers.count != 3 {
                if let randomKey = keys.randomElement(),
                   !wrongAnswers.contains(randomKey) && randomKey != actor {
                    wrongAnswers.append(randomKey)
                }
            }
            
            wrongAnswers.append(actor)
            wrongAnswers.shuffle()
            
            let question = Question(
                imageActor: image ?? UIImage(),
                correctAnswer: actor,
                answers: wrongAnswers,
                help: help
            )
            questions.append(question)
        }
        return questions
    }
}
