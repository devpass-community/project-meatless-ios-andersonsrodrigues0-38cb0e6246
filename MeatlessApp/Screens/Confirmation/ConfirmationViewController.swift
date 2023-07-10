import UIKit

final class ConfirmationViewController: UIViewController {

    private lazy var confirmationView: ConfirmationView = {

        let view = ConfirmationView()
        return view
    }()
    
    let service = Service()
    
    override func loadView() {
        self.view = confirmationView
    }

    override func viewDidLoad() {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
