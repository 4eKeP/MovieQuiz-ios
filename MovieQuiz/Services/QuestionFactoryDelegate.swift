//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFaildToLoadData(with error: Error)
}
