//
//  DBManager.swift
//  RealtimeChatAndTinderClone
//
//  Created by Ravi Bastola on 3/7/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum Nodes: String {
    case User = "users"
}


struct FireBaseDBManager {
    
    static let shared: FireBaseDBManager = FireBaseDBManager()
    
    private init() {}
}

extension FireBaseDBManager {
    
    @discardableResult
    func save(dataDict: [String: Any?], withNode node: String) -> Bool {
        
        Database.database().reference().child(node)
            .child(dataDict["uid"] as! String)
            .updateChildValues(dataDict as [AnyHashable : Any]) { (error, data) in
                if error != nil {
                    print(error ?? "hello world")
                }
                // need to refactor or may be caputre this to do something when the 
        }
        return true
    }
}
