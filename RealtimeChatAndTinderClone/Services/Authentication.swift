//
//  Authentication.swift
//  RealtimeChatAndTinderClone
//
//  Created by Ravi Bastola on 3/7/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation
import FirebaseAuth


struct Authentication {
   
    static let shared: Authentication = Authentication()
    
    private init () {}

}

extension Authentication {
    
     func register(email: String, password: String, completion: @escaping((Result<AuthDataResult?, Error>) -> Void )) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (response, error) in
            
            if error != nil {
                completion(.failure(error!))
            }
            
            guard let serverResponse = response else { return }
            
            completion(.success(serverResponse))
            
            
        }
    }
}
