import UIKit

protocol OrderViewDelegate: AnyObject {
    
    func didPressSendOrderButton()
}

final class OrderView: UIView {
    
    weak var delegate: OrderViewDelegate?
    
    private var mainStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    private var totalStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Total"
        label.textAlignment = .left
        return label
    }()

    lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primary")
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "$ 0,00"
        label.textAlignment = .right
        return label
    }()
    
    lazy var sendOrderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit order", for: .normal)
        button.backgroundColor = UIColor(named: "primary")
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(sendOrderButtonPressed), for: .touchUpInside)
        return button
    }()
    
    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sendOrderButtonPressed() {
        
        delegate?.didPressSendOrderButton()
    }
}

private extension OrderView {

    func setupViews() {

        self.backgroundColor = .white

        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {
        
        addSubview(mainStackView)
        addSubview(totalStackView)
        
        totalStackView.addArrangedSubview(totalLabel)
        totalStackView.addArrangedSubview(totalValueLabel)
        
        mainStackView.addArrangedSubview(totalStackView)
        mainStackView.addArrangedSubview(sendOrderButton)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            totalStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            totalStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            sendOrderButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            sendOrderButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            sendOrderButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
