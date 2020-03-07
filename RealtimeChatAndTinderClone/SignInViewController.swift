import UIKit

class SignInViewController: UIViewController {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your email address"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showSignInScreen), for: .touchUpInside)
        
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showForgotScreen), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    
    func setupUI() {
        setupTitle()
        setupStackViewAndConstraints()
        setupSignUpLabel()
        setupForgotPasswordButton()
    }
    
    fileprivate func setupTitle() {
        let title = "Sign In"
        
        let attributedText = NSMutableAttributedString(string:  title, attributes: [
            NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!,
            NSAttributedString.Key.foregroundColor : UIColor.black,
        ])
        
        
        headerLabel.numberOfLines = 0
        
        headerLabel.lineBreakMode = .byCharWrapping
        
        headerLabel.attributedText = attributedText
        
        // laying out the profile image view
        
        
        [headerLabel, forgotPasswordButton].forEach { (customView) in
            view.addSubview(customView)
        }
        
        // adding constraints
        NSLayoutConstraint.activate([
            
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        ])
    }
    
    fileprivate func setupStackViewAndConstraints() {
        
        // adding constraints to ui elements before adding them to the stack view
        
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            signInButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // stack view initialization
        
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField, emailTextField, passwordTextField, signInButton, signUpButton
        ])
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        
        stackView.spacing = 10
        
        stackView.distribution = .equalSpacing
        
        stackView.alignment = .center
        
        // constraints for stack view
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    fileprivate func setupSignUpLabel() {
        let attributedTermText = NSMutableAttributedString(string: "Don't Have an account? ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        let attributedTermBoldText = NSMutableAttributedString(string: "Sign Up", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        attributedTermText.append(attributedTermBoldText)
        
        signUpButton.setAttributedTitle(attributedTermText, for: .normal)
    }
    
    fileprivate func setupForgotPasswordButton() {
        let attributedTermText = NSMutableAttributedString(string: "Forgot Password? ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        forgotPasswordButton.setAttributedTitle(attributedTermText, for: .normal)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func showSignInScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showForgotScreen() {
        navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }
}
