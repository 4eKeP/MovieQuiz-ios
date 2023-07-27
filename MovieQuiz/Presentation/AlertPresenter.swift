//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import UIKit

final class AlertPresenter: AlertProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func requestAlert(alertModel: AlertModel) {
        let alert = UIAlertController(title: alertModel.title,
                                      message: alertModel.text,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion?()
        }
        alert.addAction(action)
        
        guard let viewController = viewController else {return}
        viewController.present(alert, animated: true)
    }
    
    
}
