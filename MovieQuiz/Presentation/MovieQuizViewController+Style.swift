//
//  MovieQuizViewController+Style.swift
//  MovieQuiz
//
//  Created by admin on 01.07.2023.
//

import UIKit

extension MovieQuizViewController {
    //ДЛЯ РЕВЬЮЕРА!!//
    // пожалуйста отразите в ревью работает ли шрифт, так как у меня попался баг с добавлением шрифтов, я сделал все как указанно в иструкции повторял несколько раз, искал решение в интернете и у наставника, наставник посаветовал шрифт прописать вручную, собственно так я и сделал.
    func screenStyle() {
        viewStyle()
        questionTitleLabelStyle()
        counterLabelStyle()
        imageViewStyle()
        questionLabelStyle()
        yesButtonStyle()
        noButtonStyle()
    }
    
    func viewStyle(){
        view.backgroundColor = .ypBlack
    }
    
    func questionTitleLabelStyle() {
        questionTitleLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        questionTitleLabel.textColor = .ypWhite
    }
    
    func counterLabelStyle() {
        counterLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        counterLabel.textColor = .ypWhite
    }
    
    func imageViewStyle() {
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .ypWhite
    }
    
    func questionLabelStyle() {
        questionLabel.textColor = .ypWhite
        questionLabel.font = UIFont(name: "YSDisplay-Bold", size: 23)
        questionLabel.numberOfLines = 2
        questionLabel.textAlignment = .center
    }
    
    func yesButtonStyle() {
        yesButton.setTitle("Да", for: .normal)
        yesButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
        yesButton.setTitleColor(.ypBlack, for: .normal)
        yesButton.layer.cornerRadius = 15
        yesButton.backgroundColor = .ypWhite
       
    }
    func noButtonStyle() {
        noButton.setTitle("Нет", for: .normal)
        noButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
        noButton.setTitleColor(.ypBlack, for: .normal)
        noButton.layer.cornerRadius = 15
        noButton.backgroundColor = .ypWhite
        
    }
    
    func imageViewBorderStyle(result isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        imageView.layer.cornerRadius = 20
    }
}
