//
//  AlertDelegate.swift
//  MovieQuiz
//
//  Created by admin on 17.07.2023.
//

import Foundation

protocol AlertDelegate: AnyObject {
    func didReceiveAlert(alert: AlertModel?)
}
