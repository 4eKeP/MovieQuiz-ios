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
    var correctAnswers: Int = 0
    
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    var questionFactory: QuestionFactoryProtocol?
    private var statisticService: StatisticService = StatisticServiceImplementation()
    private var alertPresenter: AlertPresenter?
    
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
       didAnswer(isYes: true)
    }
    func noButtonPressed() {
        didAnswer(isYes: false)
    }
    
    private func didAnswer(isYes: Bool){
        guard let currentQuestion = currentQuestion else { return }
        let userAnswer = isYes
        viewController?.showAnswerResult(isCorrect: userAnswer == currentQuestion.correctAnswer)
    }
    
    func buttonsIsDisabled(noButton: UIButton, yesButton: UIButton){
        noButton.isEnabled = false
        yesButton.isEnabled = false
    }
    
    func buttonsIsEnabled(noButton: UIButton, yesButton: UIButton){
        noButton.isEnabled = true
        yesButton.isEnabled = true
    }
    
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else { return }
        currentQuestion = question
        let viewModel = convert(model: question)
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.show(quiz: viewModel)
        }
    }
    
    func showNextQuestionOrResult() {
        if self.isLastQuestuion() {

            let text = "Вы ответили на \(correctAnswers) из 10, попробуйте еще раз!"
            
            let viewModel = QuizResultsViewModel(title: "Этот раунд окончен!",
                                                 text: text,
                                                 buttonText: "Сыграть ещё раз")
            viewController?.show(quiz: viewModel)
        }else{
            self.switchToNextQuestion()
            questionFactory?.requestNextQuestion()
        }
    }
}
