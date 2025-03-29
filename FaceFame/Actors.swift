//
//  Actors.swift
//  FaceFame
//
//  Created by Ast on 20.03.2025.
//

import Foundation
import UIKit

enum Theme {
    case male
    case female
    case mixed

    func getActors() -> [[String]] {
        switch self {
        case .male:
            return DataStore.maleActors
        case .female:
            return DataStore.femaleActors
        case .mixed:
            return (DataStore.femaleActors + DataStore.femaleActors).shuffled()
        }
    }
}

struct Question {

    let imageActor: UIImage
    let correctAnswer: String
    let answers: [String]
    let help: String

    static func getQuestion(count: Int, theme: Theme) -> [Question] {
        var questions: [Question] = []
        let actors = theme.getActors().shuffled()

        let numberOfQuestions = min(count, actors.count)

        for i in 0..<numberOfQuestions {
            let actorInfo = actors[i]
            let actor = actorInfo[0]
            let help = actorInfo[1]
            let image = UIImage(named: actor) ?? UIImage()

            let wrongAnswers = actors.filter { $0[0] != actor }.map { $0[0] }.shuffled().prefix(3)
            let allAnswers = Array(wrongAnswers) + [actor]
            let shuffledAnswers = allAnswers.shuffled()

            let question = Question(
                imageActor: image,
                correctAnswer: actor,
                answers: shuffledAnswers,
                help: help
            )
            questions.append(question)
        }
        return questions
    }
}
