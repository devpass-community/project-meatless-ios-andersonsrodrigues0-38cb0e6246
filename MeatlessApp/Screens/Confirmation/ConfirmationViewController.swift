import UIKit

final class ConfirmationViewController: UIViewController {

    private lazy var confirmationView: ConfirmationView = {

        let view = ConfirmationView()
        view.delegate = self
        return view
    }()
    
    let service = Service()
    
    override func loadView() {
        self.view = confirmationView
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {
    
    func didPressBackButton() {
        dismiss(animated: true)
    }
}
