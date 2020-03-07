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
        button.backgroundColor = .systemBlue
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Sign In With Google", for: .normal)
        
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign In With Email", for: .normal)
        
        return button
    }()
    
    lazy var termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms Of Use"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    func setupUI() {
        let title = "Create a new account"
        let subtitle = "\n\n This is the subtitle which was meant to be a subtitle and ended up being a subtitle which to much more to be a subtitle."
        
        //NSAttributed String
        
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
        
        view.addSubview(createAccountLabel)
        
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createAccountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            createAccountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(facebookButton)
        
        view.addSubview(googleButton)
        
        view.addSubview(orLabel)
        
        view.addSubview(emailButton)
        
        view.addSubview(termsOfUseLabel)
        
        [facebookButton, googleButton, orLabel, emailButton, termsOfUseLabel].forEach { (customViews) in
            view.addSubview(customViews)
            customViews.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
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
            orLabel.bottomAnchor.constraint(equalTo: emailButton.topAnchor, constant: -25),
            
            emailButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailButton.heightAnchor.constraint(equalToConstant: 50),
            emailButton.bottomAnchor.constraint(equalTo: termsOfUseLabel.topAnchor, constant: -25),
            
            termsOfUseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termsOfUseLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
        ])
    }
    
    
}

