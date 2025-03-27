//
//  Actors.swift
//  FaceFame
//
//  Created by Ast on 20.03.2025.
//

import UIKit

struct Question {
    
    let imageActor: UIImage
    let correctAnswer: String
    let answers: [String]
    let help: String
    
    static func getQuestion(count: Int) -> [Question] {
        
        var questions: [Question] = []
        var actors = DataStore.maleActors
        var isMale = true
        
        for i in 0..<count {
            
            let keys = Array([actors].shuffled()[0].keys)
            let values = Array([actors].shuffled()[0].values)
            
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
            
            if isMale {
                actors = DataStore.femaleActors
                isMale = false
            } else {
                actors = DataStore.maleActors
                isMale = true
            }
            
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
