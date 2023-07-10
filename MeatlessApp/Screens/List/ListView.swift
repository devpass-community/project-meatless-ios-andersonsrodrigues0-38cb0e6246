import UIKit

protocol ListViewDelegate: AnyObject {
    
    func didTapRestaurant(restaurant: Restaurant)
}

final class ListView: UIView {
    
    weak var delegate: ListViewDelegate?

    static let cellSize = CGFloat(78)

    private let cellIdentifier = "RestaurantCellIdentifier"
    
    private var restaurants: [Restaurant] = []

    lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        setupViews()

        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView {
    
    func updateView(restaurants: [Restaurant]) {
        
        self.restaurants = restaurants
        tableView.reloadData()
    }
}

private extension ListView {

    func setupViews() {

        backgroundColor = .white

        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {

        addSubview(tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellView

        // STORY 2: Configure cell with the restaurant information.

        return cell
    }
}

extension ListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // STORY 3: Pass the selected restaurant to DetailViewController.
        
    }
}
