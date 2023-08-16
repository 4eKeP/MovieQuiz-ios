//
//  AlertProtocol.swift
//  MovieQuiz
//
//  Created by admin on 17.07.2023.
//

import UIKit

protocol AlertProtocol {
    func requestAlert(in vc: UIViewController, alertModel: AlertModel)
}
