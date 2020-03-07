import UIKit

class ViewController: UIViewController {

    //MARK:- Properties
    
    lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a new account"
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
        view.backgroundColor = .systemRed
    }


}

