//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by admin on 16.08.2023.
//

import Foundation

protocol MovieQuizControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrect: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
}
