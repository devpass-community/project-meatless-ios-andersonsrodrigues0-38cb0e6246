import UIKit

protocol DetailViewDelegate: AnyObject {
    
    func didPressSendOrderButton()
}

class DetailView: UIView {
    
    static let cellHeight = CGFloat(96)
    static let headerHeight = CGFloat(83)

    weak var delegate: DetailViewDelegate?
    
    private let cellIdentifier = "MenuCellIdentifier"
    private var restaurant: Restaurant!

    let headerView: HeaderView = {

        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    lazy var orderView: OrderView = {
      
        let orderView = OrderView()
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.delegate = self
        return orderView
    }()

    init() {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    
    func updateView(restaurant: Restaurant) {

        self.restaurant = restaurant
        tableView.reloadData()
    }
}

private extension DetailView {
    
    func setupViews() {
        
        backgroundColor = .white

        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {

        addSubview(tableView)
        addSubview(orderView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: orderView.topAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            orderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            orderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            orderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            orderView.heightAnchor.constraint(equalToConstant: 124)
        ])
    }
}

// STORY 3: Configure UITableViewDataSource to show the restaurants' menu list.

extension DetailView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuCellView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: DetailView.headerHeight))
        
        // STORY 4: Configure HeaderView with the Restaurant instance data.

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return DetailView.headerHeight
    }
}

extension DetailView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return DetailView.cellHeight
    }
}

extension DetailView: OrderViewDelegate {
    
    func didPressSendOrderButton() {
        
        delegate?.didPressSendOrderButton()
    }
}
