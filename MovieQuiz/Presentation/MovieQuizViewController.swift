import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizControllerProtocol {
    
    private var alertPresenter = AlertPresenter()
    private var quizPresenter: MovieQuizPresenter!

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var questionTitleLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var noButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenStyle()
        quizPresenter = MovieQuizPresenter(viewController: self)
    }
    
    // MARK: - Actions
    
    @IBAction private func noButtonPressed(_ sender: UIButton) {
        buttonsIsDisabled()
        quizPresenter.noButtonPressed()
    }
    
    @IBAction private func yesButtonPressed(_ sender: UIButton) {
        buttonsIsDisabled()
        quizPresenter.yesButtonPressed()
    }
    
    // MARK: - Private functions
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        let title = "Ошибка"
        let buttonText = "Попробовать ещё раз"
        let alertId = "NetworkError"
        let alertModel = AlertModel(title: title,
                                    text: message,
                                    buttonText: buttonText,
                                    alertId: alertId
        ){ [weak self] in
            guard let self = self else {return}
            quizPresenter.restartQuiz()
        }
        alertPresenter.requestAlert(in: self, alertModel: alertModel)
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    
    func highlightImageBorder(isCorrect: Bool) {
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        questionLabel.text = step.question
        counterLabel.text = step.questionNumber
        imageView.layer.borderColor = UIColor.clear.cgColor
        buttonsIsEnabled()
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let message = quizPresenter.makeResultMessage()
        
        let alertId = "GameResult"
        
        let alertModel = AlertModel(title: result.title,
                                    text: message,
                                    buttonText: result.buttonText,
                                    alertId: alertId)
        { [weak self] in
            guard let self = self else { return }
            
            self.quizPresenter.restartQuiz()
        }
        alertPresenter.requestAlert(in: self, alertModel: alertModel)
    }
    
    func buttonsIsDisabled() {
        noButton.isEnabled = false
        yesButton.isEnabled = false
    }
    
    func buttonsIsEnabled() {
        noButton.isEnabled = true
        yesButton.isEnabled = true
    }
    
    private func screenStyle() {
        viewStyle()
        questionTitleLabelStyle()
        counterLabelStyle()
        imageViewStyle()
        imageViewBorderStyle()
        questionLabelStyle()
        yesButtonStyle()
        noButtonStyle()
    }
    
    private func viewStyle() {
        view.backgroundColor = .ypBlack
    }
    
    private func questionTitleLabelStyle() {
        questionTitleLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        questionTitleLabel.textColor = .ypWhite
    }
    
    private func counterLabelStyle() {
        counterLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        counterLabel.textColor = .ypWhite
    }
    
    private func imageViewStyle() {
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .ypWhite
    }
    
    private func questionLabelStyle() {
        questionLabel.textColor = .ypWhite
        questionLabel.font = UIFont(name: "YSDisplay-Bold", size: 23)
        questionLabel.numberOfLines = 2
        questionLabel.textAlignment = .center
    }
    
    private func yesButtonStyle() {
        yesButton.setTitle("Да", for: .normal)
        yesButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
        yesButton.setTitleColor(.ypBlack, for: .normal)
        yesButton.layer.cornerRadius = 15
        yesButton.backgroundColor = .ypWhite
        
    }
    private func noButtonStyle() {
        noButton.setTitle("Нет", for: .normal)
        noButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
        noButton.setTitleColor(.ypBlack, for: .normal)
        noButton.layer.cornerRadius = 15
        noButton.backgroundColor = .ypWhite
        
    }
    
    private func imageViewBorderStyle() {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.layer.cornerRadius = 20
    }
}
