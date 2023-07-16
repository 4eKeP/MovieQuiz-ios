//
//  AlertFactory.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import UIKit

protocol AlertFactoryProtocol {
    var delegate: AlertFactoryDelegate? {get set}
    func show(result: AlertModel) -> UIViewController
}
