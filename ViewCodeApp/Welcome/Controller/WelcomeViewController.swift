import UIKit

class WelcomeViewController: UIViewController {
    
    override func loadView() {
        view = WelcomeView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyBoardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let keyBoardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
        
        (view as? WelcomeView)?.scrollView.contentInset.bottom = keyBoardFrame.size.height - view.safeAreaInsets.bottom
        (view as? WelcomeView)?.scrollView.verticalScrollIndicatorInsets.bottom = keyBoardFrame.size.height - view.safeAreaInsets.bottom
    }
    
    @objc private func keyBoardWillHide(notification: NSNotification) {
        (view as? WelcomeView)?.scrollView.contentInset.bottom = 0
        (view as? WelcomeView)?.scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonTapped(withPhone: String) {
        print("login")
    }
    
    func signUpButtonTapped() {
        print("signUP")
    }
    
    func facebookButtonTapped() {
        
    }
    
    func googleButtonTapped() {
        
    }
    
    
}
