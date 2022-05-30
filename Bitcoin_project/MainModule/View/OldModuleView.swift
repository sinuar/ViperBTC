//
//  OldModuleView.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 24/05/22.
//

import UIKit
/*
class MainModuleView: UIViewController {
    // MARK: - MainModulePresenterProtocol properties
    var presenter: MainModulePresenterProtocol?
    
    // MARK: - Private Properties
    let stackView: UIStackView = UIStackView()
    let icon: UIImageView = { topIcon() }()
    let iconContainer: UIView = UIView()
    let headerContainer: UIView = UIView()
    let headerTextView: UITextView = { headerTitleTextView() }()
    let operationTimeContainer: UIView = UIView()
    let operationTimeLabel: UILabel = { getOperationTimeLabel() }()
    let subtitleContainer: UIView = UIView()
    let subtitleLabel: UILabel = { getSubtitleLabel() }()
    var planChartContainer: UIView = UIView()
    var planChart: UIStackView = UIStackView()
    let backButton: UIButton = { getButton() }()
    let backButtonContainer: UIView = UIView()
    
    // MARK: - Plan Chart Stackview properties
    let planChartStackView: UIStackView = UIStackView()
    let amountTitle: UILabel = UILabel()
    let amountValue: UILabel = UILabel()
    let colorBarContainer: UIView = UIView()
    let colorBar: UIView = UIView()
    let easySavingsPortion: UIView = UIView()
    let promissoryPortion: UIView = UIView()
    let easySavingsStack: UIStackView = UIStackView()
    let promissoryStack: UIStackView = UIStackView()
    let investmentStack: UIStackView = UIStackView()
    let horizonLabel: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        setupView()
        
    }
    
    // MARK: - Private methods
    private func setupView() {
        let subViews: [UIView] = [icon, stackView, headerContainer,
                                  headerTextView, iconContainer,
                                  operationTimeContainer, operationTimeLabel,
                                  subtitleContainer, subtitleLabel,
                                  backButton]
        for subView in subViews {
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(stackView)
        addStackArrangedSubViews()
        setStackView()
        
    }
    
    private func addStackArrangedSubViews() {
        planChart = getPlanChartView()
        let stackSubviews: [UIView] = [iconContainer, headerContainer, getWhiteView(withHeight: 16), operationTimeContainer, getWhiteView(withHeight: 8), subtitleContainer, getWhiteView(withHeight: 8), planChartContainer, getWhiteView(), backButtonContainer ]
        
        for stackSubview in stackSubviews {
            stackView.addArrangedSubview(stackSubview)
        }
    }
    
    private func setStackView() {
        stackView.distribution = .fill
        stackView.axis = .vertical
        setContainersSubviews()
        setIconAnchors()
        setHeaderTextViewAnchors()
        setPlanChartContainer()
        setPlanChartAnchors()
        setOperationTimeLabel()
        setBackButtonAnchors()
        setSubtitleLabel()
        setBackButtonAnchors()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    private func setContainersSubviews() {
        iconContainer.addSubview(icon)
        headerContainer.addSubview(headerTextView)
        operationTimeContainer.addSubview(operationTimeLabel)
        subtitleContainer.addSubview(subtitleLabel)
        planChartContainer.addSubview(planChart)
        icon.contentMode = .scaleAspectFill
    }
    
    private func setIconAnchors() {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            icon.widthAnchor.constraint(equalTo: iconContainer.heightAnchor),
            icon.topAnchor.constraint(equalTo: iconContainer.topAnchor),
            icon.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: 16),
            icon.bottomAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: -20),
        ])
    }
    
    private func setHeaderTextViewAnchors() {
        NSLayoutConstraint.activate([
            headerTextView.topAnchor.constraint(equalTo: headerContainer.topAnchor),
            headerTextView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 16),
            headerTextView.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -16),
            headerTextView.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            headerTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func setPlanChartContainer() {
            planChartContainer.layer.shadowColor = UIColor.darkGray.cgColor
            planChartContainer.layer.shadowOpacity = 0.3
            planChartContainer.layer.shadowOffset = CGSize(width: 0, height: 4)
            planChartContainer.layer.shadowRadius = 4
            planChartContainer.backgroundColor = .white
    }
    
    private func setPlanChartAnchors() {
        NSLayoutConstraint.activate([
            planChart.topAnchor.constraint(equalTo: planChartContainer.topAnchor),
            planChart.leadingAnchor.constraint(equalTo: planChartContainer.leadingAnchor, constant: 16),
            planChart.trailingAnchor.constraint(equalTo: planChartContainer.trailingAnchor, constant: -16),
            planChart.bottomAnchor.constraint(equalTo: planChartContainer.bottomAnchor),
        ])
    }
    
    private func setOperationTimeLabel() {
        NSLayoutConstraint.activate([
            operationTimeLabel.topAnchor.constraint(equalTo: operationTimeContainer.topAnchor),
            operationTimeLabel.leadingAnchor.constraint(equalTo: operationTimeContainer.leadingAnchor, constant: 16),
            operationTimeLabel.trailingAnchor.constraint(equalTo: operationTimeContainer.trailingAnchor, constant: -16),
            operationTimeLabel.bottomAnchor.constraint(equalTo: operationTimeContainer.bottomAnchor)
        ])
    }
    
    private func setSubtitleLabel() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleContainer.topAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleContainer.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleContainer.trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleContainer.bottomAnchor)
        ])
    }
    
    private func setBackButtonAnchors() {
        backButtonContainer.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: backButtonContainer.topAnchor),
            backButton.widthAnchor.constraint(equalTo: backButtonContainer.widthAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            backButton.bottomAnchor.constraint(equalTo: backButtonContainer.bottomAnchor, constant: -8),
            backButton.centerXAnchor.constraint(equalTo: backButtonContainer.centerXAnchor),
        ])
    }
    
    private func getWhiteView(withHeight height: CGFloat? = nil) -> UIView {
        let whiteView: UIView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        guard let heightConstant: CGFloat = height else {
            whiteView.setContentHuggingPriority(.init(249), for: .vertical)
            whiteView.setContentHuggingPriority(.init(249), for: .horizontal)
            return whiteView
        }
        whiteView.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        return whiteView
    }
    
    private static func topIcon() -> UIImageView {
        let imageView: UIImageView = UIImageView()
        imageView.image = .strokedCheckmark
        return imageView
    }
    
    private static func headerTitleTextView() -> UITextView {
        let textView: UITextView = UITextView()
        let atributtedString = NSMutableAttributedString(string: "Tu Plan de Inversión estará disponible pronto")
        atributtedString.addAttribute(.link, value: "https://www.unam.mx", range: NSRange (location: 3, length: 17))
        textView.attributedText = atributtedString
        textView.isEditable = false
        textView.font = UIFont.boldSystemFont(ofSize: 28)
        return textView
    }
    
    private static func getOperationTimeLabel() -> UILabel {
        let label: UILabel = UILabel()
        label.text = "Regresa de lunes a viernes de 09:00 a 14:00 h."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
    
    private static func getSubtitleLabel() -> UILabel {
        let label: UILabel = UILabel()
        label.text = "Mientras tanto te compartimos un ejemplo de cómo se podría dividir tu plan"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }
    
    enum ProductAlertInfo {
        case easySavings
        case promissoryNote
        case investmentFunds
        
        var bulletColor: UIColor {
            switch self {
            case .easySavings:
                return UIColor.systemPink
            case .promissoryNote:
                return UIColor.systemBlue
            case .investmentFunds:
                return UIColor.cyan
            }
        }
        
        var percentageLabel: String {
            switch self {
            case .easySavings:
                return "10% en ahorro fácil"
            case .promissoryNote:
                return "30% en pagaré"
            case .investmentFunds:
                return "60% en fondos de inversión"
            }
        }
        
        var amountString: String {
            switch self {
            case .easySavings:
                return "$1,000.00"
            case .promissoryNote:
                return "$3,000.00"
            case .investmentFunds:
                return "$6,000.00"
            }
        }
    }
    
    private func productInfoStack(productInfo: ProductAlertInfo) -> UIStackView {
        let productInfoStackView: UIStackView = UIStackView()
        let colorBullet: UIView = UIView()
        let colorBulletContainer: UIView = UIView()
        let percentageLabel: UILabel = UILabel()
        let infoButton: UIButton = UIButton()
        let amountLabel: UILabel = UILabel()
        
        
        addProductSubviews([colorBullet, colorBulletContainer, percentageLabel, infoButton, amountLabel],
                           toProductInfoStack: productInfoStackView)
        
        colorBullet.translatesAutoresizingMaskIntoConstraints = false
        productInfoStackView.spacing = 4
        colorBulletContainer.addSubview(colorBullet)
        productInfoStackView.distribution = .fill
        colorBullet.backgroundColor = productInfo.bulletColor
        
        setColorBullets(colorBullet, colorBulletContainer)
        
        setPercentageLabels(percentageLabel, productInfo)
        
        setAmountLabel(amountLabel, productInfo)
        
        infoButton.setImage(.add, for: .normal)
        
        setToolTipsAction(with: productInfo, infoButton: infoButton)
        
        return productInfoStackView
    }
    
    private func addProductSubviews(_ subViews: [UIView], toProductInfoStack productInfoStackView: UIStackView) {
        var productInfoSubviews: [UIView] = []
        for subView in subViews {
            productInfoSubviews.append(subView)
        }
        
        for productInfoSubview in productInfoSubviews {
            productInfoSubview.translatesAutoresizingMaskIntoConstraints = false
            productInfoStackView.addArrangedSubview(productInfoSubview)
        }
    }
    
    private func setPercentageLabels(_ percentageLabel: UILabel ,_ productInfo: ProductAlertInfo) {
        percentageLabel.text = productInfo.percentageLabel
        percentageLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func setAmountLabel(_ amountLabel: UILabel,_ productInfo: ProductAlertInfo) {
        amountLabel.textAlignment = .right
        amountLabel.font = UIFont.systemFont(ofSize: 14)
        amountLabel.setContentHuggingPriority(.init(249), for: .horizontal)
        amountLabel.text = productInfo.amountString
    }
    
    private func setColorBullets(_ colorBullet: UIView, _ colorBulletContainer: UIView) {
        NSLayoutConstraint.activate([
            colorBulletContainer.widthAnchor.constraint(equalToConstant: 12),
            colorBullet.leadingAnchor.constraint(equalTo: colorBulletContainer.leadingAnchor),
            colorBullet.widthAnchor.constraint(equalToConstant: 4),
            colorBullet.heightAnchor.constraint(equalTo: colorBulletContainer.heightAnchor, multiplier: 0.9),
            colorBullet.centerYAnchor.constraint(equalTo: colorBulletContainer.centerYAnchor),
        ])
        
    }
    
    private func setToolTipsAction(with productInfo: ProductAlertInfo, infoButton: UIButton) {
        switch productInfo {
        case .easySavings:
            infoButton.addTarget(self, action: #selector(easySavingsAction), for: .touchUpInside)
        case .promissoryNote:
            infoButton.addTarget(self, action: #selector(promissoryNoteAction), for: .touchUpInside)
        case .investmentFunds:
            infoButton.addTarget(self, action: #selector(investmentFundsAction), for: .touchUpInside)
        }
    }
    
    @objc public func easySavingsAction() {
        print("easy savings info button was tapped")
    }
    
    @objc public func promissoryNoteAction() {
        print("promissory note info button was tapped")
    }
    
    @objc public func investmentFundsAction() {
        print("investment funds info button was tapped")
    }
    
    private func getPlanChartView() -> UIStackView {
    
        planChartStackView.axis = .vertical
        planChartStackView.distribution = .fill
        
        planChartTamicToFalse()
        addPlanChartSubviews()
        addColorBarSubViews()
        setColorBarAnchors()
        setAmountExample()
        setEasySavings()
        setPromissoryAnchors()
        addEasySavingsSubviews()
        
        horizonLabel.text = "Horizonte de inversión recomendado 1.5 años"
        horizonLabel.font = UIFont.systemFont(ofSize: 12)
        return planChartStackView
    }
    
    private func planChartTamicToFalse() {
        let planChartViews: [UIView] = [planChartStackView, amountTitle, amountValue, colorBarContainer, colorBar, easySavingsPortion,
        promissoryPortion, promissoryStack, investmentStack,
        horizonLabel]
        
        for planChartView in planChartViews {
            planChartView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addPlanChartSubviews() {
        let planChartStackSubviews: [UIView] = [getWhiteView(withHeight: 16), amountTitle, amountValue, colorBarContainer, easySavingsStack, getWhiteView(withHeight: 4), promissoryStack, getWhiteView(withHeight: 4), investmentStack, getWhiteView(withHeight: 4), horizonLabel, getWhiteView(withHeight: 16) ]
        
        for planChartStackSubview in planChartStackSubviews {
            planChartStackView.addArrangedSubview(planChartStackSubview)
        }
    }
    
    private func setAmountExample() {
        amountTitle.text = "Monto ejemplo"
        amountTitle.font = UIFont.boldSystemFont(ofSize: 14)
        amountValue.text = "$10,000.00"
        amountValue.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private func addColorBarSubViews() {
        colorBarContainer.addSubview(colorBar)
        colorBar.addSubview(easySavingsPortion)
        colorBar.addSubview(promissoryPortion)
        colorBar.backgroundColor = .cyan
    }
    
    private func setColorBarAnchors() {
        NSLayoutConstraint.activate([
            colorBarContainer.heightAnchor.constraint(equalToConstant: 40),
            colorBar.heightAnchor.constraint(equalToConstant: 24),
            colorBar.widthAnchor.constraint(equalTo: colorBarContainer.widthAnchor),
            colorBar.centerYAnchor.constraint(equalTo: colorBarContainer.centerYAnchor),
            colorBar.centerXAnchor.constraint(equalTo: colorBarContainer.centerXAnchor),
        ])
    }
    
    private func addEasySavingsSubviews() {
        easySavingsStack.addArrangedSubview(productInfoStack(productInfo: .easySavings))
        promissoryStack.addArrangedSubview(productInfoStack(productInfo: .promissoryNote))
        investmentStack.addArrangedSubview(productInfoStack(productInfo: .investmentFunds))
    }
    
    private func setEasySavings() {
        NSLayoutConstraint.activate([
            easySavingsPortion.leadingAnchor.constraint(equalTo: colorBar.leadingAnchor),
            easySavingsPortion.heightAnchor.constraint(equalTo: colorBar.heightAnchor),
            easySavingsPortion.widthAnchor.constraint(equalTo: colorBar.widthAnchor, multiplier: 0.1),
            easySavingsPortion.centerYAnchor.constraint(equalTo: colorBar.centerYAnchor),
            ])
        easySavingsPortion.backgroundColor = .systemPink
    }
    
    private func setPromissoryAnchors() {
        NSLayoutConstraint.activate([
            promissoryPortion.leadingAnchor.constraint(equalTo: easySavingsPortion.trailingAnchor),
            promissoryPortion.heightAnchor.constraint(equalTo: colorBar.heightAnchor),
            promissoryPortion.widthAnchor.constraint(equalTo: colorBar.widthAnchor, multiplier: 0.3),
            promissoryPortion.centerYAnchor.constraint(equalTo: colorBar.centerYAnchor),
        ])
        promissoryPortion.backgroundColor = .systemBlue
    }
    
    private static func getButton() -> UIButton {
        let button: UIButton = UIButton()
        button.setTitle("Regresar", for: .normal)
        button.backgroundColor = .blue
        return button
    }
}

extension MainModuleView: MainModuleViewProtocol {
    func loadedView(data: [BTCRate]) {
    }
}

extension MainModuleView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}

*/

