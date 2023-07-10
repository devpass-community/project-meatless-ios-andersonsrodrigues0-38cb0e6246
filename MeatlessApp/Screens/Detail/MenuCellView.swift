import UIKit

// STORY 5: Implement minusButton and plusButton actions. Whenever they're pressed, quantityLabel must be updated accordingly.

class MenuCellView: UITableViewCell {
    
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

    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "pizza")
        return imageView
    }()

    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "Item name"
        return label
    }()

    lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primary")
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "$ 0,00"
        return label
    }()
    
    private var buttonsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fillProportionally
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    lazy var minusButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "icon-minus"), for: .normal)
        return button
    }()
    
    lazy var plusButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "icon-plus"), for: .normal)
        return button
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "0"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuCellView {
    
    func updateView(menuItem: MenuItem) {
        
        // STORY 3: Configure MenuCellView with the MenuItem data.

    }
}

private extension MenuCellView {
    
    func setupViews() {
        
        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {

        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(itemImageView)
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(buttonsStackView)

        labelsStackView.addArrangedSubview(itemNameLabel)
        labelsStackView.addArrangedSubview(itemPriceLabel)
        
        buttonsStackView.addArrangedSubview(minusButton)
        buttonsStackView.addArrangedSubview(quantityLabel)
        buttonsStackView.addArrangedSubview(plusButton)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: -16),

            itemImageView.widthAnchor.constraint(equalToConstant: 64),
            itemImageView.heightAnchor.constraint(equalToConstant: 64),

            labelsStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            labelsStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 16),
            labelsStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -16)
        ])
    }
}
