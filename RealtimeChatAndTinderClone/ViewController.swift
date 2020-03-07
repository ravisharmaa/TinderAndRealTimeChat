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
        
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sign In With Google", for: .normal)
        
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        return label
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sign In With Email", for: .normal)
        
        return button
    }()
    
    lazy var termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms Of Use"
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
    }
    
    
}

