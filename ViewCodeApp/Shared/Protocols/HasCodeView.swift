import UIKit

protocol HasCodeView {
    associatedtype CustomView: UIView
}

extension HasCodeView where Self: UIViewController {
    var customView: CustomView {
        return view as! CustomView
    }
}
