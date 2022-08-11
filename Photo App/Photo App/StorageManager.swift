//
//  StorageManager.swift
//  Photo App
//
//  Created by Антон Нарижный on 11.08.22.
//

import Foundation
import KeychainAccess

enum KeychainKeys: String {
    case passKey
}

class StorageManager {
    
    let keychain = Keychain(service: "com.tms.Photo-App")
    
    init() {}
    
    
    func savePassword(value: String, key: KeychainKeys) {
        keychain[key.rawValue] = value
    }
    
    func getPassword(key: KeychainKeys) -> String? {
        return keychain[key.rawValue]
    }
}
