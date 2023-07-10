import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        let view = ListView()
        view.delegate = self
        return view
    }()
    
    let service = Service()
    
    override func loadView() {
        self.view = listView
    }

    override func viewDidLoad() {
        
        navigationItem.setTitle(title: "My Home", subtitle: "123 Oak Street, Anytown, CA 12345")
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "light-green")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        service.fetchRestaurantList { restaurants in
            
            DispatchQueue.main.async {
                
                if let restaurants = restaurants {
                    
                    self.listView.updateView(restaurants: restaurants)
                }
            }
        }
    }
}

extension ListViewController: ListViewDelegate {
    
    func didTapRestaurant(restaurant: Restaurant) {
        
        // STORY 3: Implement a push navigation to DetailViewController.

    }
}
