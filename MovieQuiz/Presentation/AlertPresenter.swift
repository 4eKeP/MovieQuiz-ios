//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import UIKit

class AlertPresenter: AlertFactoryProtocol {
    weak var delegate: AlertFactoryDelegate?
    
    private func show(result: AlertModel) {
        
        let alert = UIAlertController(title: result.title, message: result.text, preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default){ [weak self] _ in
            guard let self = self else { return }
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            self.questionFactory?.requestNextQuestion()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
