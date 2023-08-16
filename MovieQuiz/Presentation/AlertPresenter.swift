//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import UIKit

final class AlertPresenter: AlertProtocol {
    
    func requestAlert(in vc: UIViewController, alertModel: AlertModel) {
        let alert = UIAlertController(title: alertModel.title,
                                      message: alertModel.text,
                                      preferredStyle: .alert)
        alert.view.accessibilityIdentifier = alertModel.alertId
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion?()
        }
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
}
