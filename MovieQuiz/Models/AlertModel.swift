//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by admin on 16.07.2023.
//

import Foundation

struct AlertModel {
    // строка с заголовком алерта
    let title: String
    // строка с текстом о количестве набранных очков
    let text: String
    // текст для кнопки алерта
    let buttonText: String
    // замыкание без параметров для действия по кнопке алерта
    var completion: () -> Void
    
}
