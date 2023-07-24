import UIKit

// STORY 6: Implement ConfirmationView's UI according to the specs on Figma.

protocol ConfirmationViewDelegate: AnyObject {
    
    func didPressBackButton()
}

class ConfirmationView: UIView {
    
    weak var delegate: ConfirmationViewDelegate?
    
    private var mainStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 32
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    private var informationStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "order-confirmation")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var confirmationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primary")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Order successfully sent!"
        label.textAlignment = .center
        return label
    }()
    
    lazy var confirmationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "An email has been sent to you with the details of your order. Please wait for the delivery confirmation from restaurant."
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to home screen", for: .normal)
        button.backgroundColor = UIColor(named: "primary")
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(frame: .zero)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backButtonPressed() {
        
        delegate?.didPressBackButton()
    }
}

private extension ConfirmationView {
    func setupViews() {
        self.backgroundColor = .white
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(mainStackView)
        addSubview(backButton)
        
        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(informationStackView)
        
        informationStackView.addArrangedSubview(confirmationTitleLabel)
        informationStackView.addArrangedSubview(confirmationDescriptionLabel)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            backButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
