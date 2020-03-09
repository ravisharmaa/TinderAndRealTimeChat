//
//  FireBaseStorage.swift
//  RealtimeChatAndTinderClone
//
//  Created by Ravi Bastola on 3/9/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation
import FirebaseStorage

struct FireBaseStorage {
    
    static let shared: FireBaseStorage = FireBaseStorage()
    
    private init () {}
    
    func store(data: Data, contentType: String, forUser: String, completion: @escaping((String?) -> ())) {
        
        let storage = Storage.storage().reference(forURL: "gs://my-ios-project-378dc.appspot.com")
        
        let storageProfile = storage.child("profile").child("yyyyyyy")
        
        let metaData = StorageMetadata()
        
        metaData.contentType = contentType
        
        storageProfile.putData(data, metadata: metaData) { (metaData, error) in
            if error != nil {
                print("error while uploading", String(describing: error?.localizedDescription))
                completion(nil)
                return
            }
            
            storageProfile.downloadURL { (url, error) in
                
                if error != nil {
                    print(String(describing: error?.localizedDescription))
                    completion(nil)
                    return
                }
                
                if let urlUnwrapped = url?.absoluteString {
                    completion(urlUnwrapped)
                }
            }
        }
    }
}
