import UIKit

// STORY 4: Implement the HeaderView's UI. Make sure to have a method `updateView` that receives a Restaurant instance and configure the UI components accordingly.

class HeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    
    func updateView(restaurant: Restaurant) {
         
    }
}
