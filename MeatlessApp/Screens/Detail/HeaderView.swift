import UIKit

// STORY 4: Implement the HeaderView's UI. Make sure to have a method `updateView` that receives a Restaurant instance and configure the UI components accordingly.

class HeaderView: UIView {
    
    private var mainStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()
    
    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        label.text = "Restaurant name"
        return label
    }()
    
    lazy var restaurantStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Restaurant name"
        return label
    }()
    
    lazy var restaurantOpenDaysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        label.text = "Restaurant name"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    
    func updateView(restaurant: Restaurant) {
        let image = UIImage(named: restaurant.image)
        logoImageView.image = image
        
        restaurantNameLabel.text = restaurant.name
        
        let openDaysAttributed = NSMutableAttributedString(string: restaurant.status)
        openDaysAttributed.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 12.0, weight: .semibold),
            range: NSRange(location: 0, length: restaurant.status.split(separator: " ")[0].count)
        )
        
        restaurantStatusLabel.attributedText = openDaysAttributed
        restaurantOpenDaysLabel.text = restaurant.openDays
    }
}

private extension HeaderView {
    func setupViews() {
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(labelsStackView)
        
        labelsStackView.addArrangedSubview(restaurantNameLabel)
        labelsStackView.addArrangedSubview(restaurantStatusLabel)
        labelsStackView.addArrangedSubview(restaurantOpenDaysLabel)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
