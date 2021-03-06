import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    
    lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sign In With Facebook", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setImage(#imageLiteral(resourceName: "Facebook"), for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.imageView?.backgroundColor =  UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1.0)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 12, left: -15, bottom: 12, right: 0)
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In With Google", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setImage(#imageLiteral(resourceName: "Google"), for: .normal)
        button.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 12, left: -35, bottom: 12, right: 0)
        
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(white: 0, alpha: 0.45)
        label.textAlignment = .center
        
        
        return label
    }()
    
    lazy var createAccount: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Create a new account", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(showSignupView), for: .touchUpInside)
       
        return button
    }()
    
    lazy var termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    func setupUI() {
        
        setupTitleLabel()
        
        setupTermsLabel()
        
        NSLayoutConstraint.activate([
            
            createAccountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            createAccountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            facebookButton.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 40),
            facebookButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            facebookButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            facebookButton.bottomAnchor.constraint(equalTo: googleButton.topAnchor, constant: -25),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
            googleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            googleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            googleButton.bottomAnchor.constraint(equalTo: orLabel.topAnchor, constant: -25),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            orLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            orLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            orLabel.bottomAnchor.constraint(equalTo: createAccount.topAnchor, constant: -25),
            
            createAccount.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            createAccount.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            createAccount.heightAnchor.constraint(equalToConstant: 50),
            createAccount.bottomAnchor.constraint(equalTo: termsOfUseLabel.topAnchor, constant: -25),
            
            termsOfUseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termsOfUseLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    func setupTitleLabel() {
        let title = "Create a new account"
        let subtitle = "\n\n This is the subtitle which was meant to be a subtitle and ended up being a subtitle which to much more to be a subtitle."
        
        
        
        let attributedText = NSMutableAttributedString(string:  title, attributes: [
            NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!,
            NSAttributedString.Key.foregroundColor : UIColor.black,
        ])
        
        let attributedSubtitle = NSMutableAttributedString(string: subtitle, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.45)
        ])
        
        attributedText.append(attributedSubtitle)
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        createAccountLabel.numberOfLines = 0
        
        createAccountLabel.lineBreakMode = .byCharWrapping
        
        createAccountLabel.attributedText = attributedText
        
        [createAccountLabel, facebookButton, googleButton, orLabel, createAccount, termsOfUseLabel].forEach { (customViews) in
            view.addSubview(customViews)
            customViews.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupTermsLabel() {
        let attributedTermText = NSMutableAttributedString(string: "By Clicking the terms of service you agree to ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        let attributedTermBoldText = NSMutableAttributedString(string: "Terms Of Service", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
        ])
        
        attributedTermText.append(attributedTermBoldText)
        
        termsOfUseLabel.attributedText = attributedTermText
        termsOfUseLabel.numberOfLines = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func showSignupView() {
//        let signupVc = SignupViewController()
//        signupVc.modalPresentationStyle = .fullScreen
//        present(signupVc, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
}

