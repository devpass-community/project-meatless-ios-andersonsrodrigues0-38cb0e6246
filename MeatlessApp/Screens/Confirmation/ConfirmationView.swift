import UIKit

// STORY 6: Implement ConfirmationView's UI according to the specs on Figma.

class ConfirmationView: UIView {

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
