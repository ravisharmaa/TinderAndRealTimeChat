import UIKit

class SignupViewController: UIViewController {
    
    //MARK:- Properties
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
        
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Name"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
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
        button.setTitle("Sign Up", for: .normal)
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
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    //MARK:- Customization
    
    func setupUI() {
        
        setupCloseButtonHeaderAndProfileImageViews()
        
        setupStackViewAndConstraints()
        
        setupSignUpLabel()
    }
    
    
    func setupCloseButtonHeaderAndProfileImageViews() {
        
        // laying out the label
        let title = "Sign up"
        
        let attributedText = NSMutableAttributedString(string:  title, attributes: [
            NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!,
            NSAttributedString.Key.foregroundColor : UIColor.black,
        ])
        
        
        headerLabel.numberOfLines = 0
        
        headerLabel.lineBreakMode = .byCharWrapping
        
        headerLabel.attributedText = attributedText
        
        // laying out the profile image view
        profileImageView.layer.cornerRadius = 40
        
        profileImageView.clipsToBounds = true
        
        [closeButton, headerLabel, profileImageView].forEach { (customView) in
            view.addSubview(customView)
        }
        
        // adding constraints
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor)
        ])
        
    }
    
    func setupStackViewAndConstraints() {
        
        // adding constraints to ui elements before adding them to the stack view
        
        NSLayoutConstraint.activate([
            
           nameTextField.heightAnchor.constraint(equalToConstant: 50),
           nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
           
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
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupSignUpLabel() {
        let attributedTermText = NSMutableAttributedString(string: "Already Have an account? ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        let attributedTermBoldText = NSMutableAttributedString(string: "Sign In", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        attributedTermText.append(attributedTermBoldText)
        
        signUpButton.setAttributedTitle(attributedTermText, for: .normal)
    }
    
    @objc func goBack() {
        //dismiss can also work here
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showSignInScreen() {
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
}
