//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by admin on 15.08.2023.
//

import UIKit

final class MovieQuizPresenter {
    
    private var currentQuestionIndex = 0
    let questionsAmount: Int = 10
    
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        QuizStepViewModel(image: UIImage(data: model.image) ?? UIImage(),
                          question: model.text,
                          questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
    }
    
    func isLastQuestuion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    
    func resetQuestonIndex() {
        currentQuestionIndex = 0
    }
    
    func switchToNextQuestion() {
        currentQuestionIndex += 1
    }
    
    func yesButtonPressed() {
        guard let currentQuestion = currentQuestion else {return}
        let userAnswer = currentQuestion.correctAnswer == true
        viewController?.showAnswerResult(isCorrect: userAnswer)
    }
    func noButtonPressed() {
        guard let currentQuestion = currentQuestion else {return}
        let userAnswer = currentQuestion.correctAnswer == false
        viewController?.showAnswerResult(isCorrect: userAnswer)
    }
    
    func buttonsIsDisabled(noButton: UIButton, yesButton: UIButton){
        noButton.isEnabled = false
        yesButton.isEnabled = false
    }
}
