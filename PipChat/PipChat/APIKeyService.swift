//
//  APIKeyService.swift
//  PipChat
//
//  Created by Macbook Pro on 16/09/2025.
//

import Foundation

enum APIKeyService{
    // Get Api key from "Ai-plist"
    static var `default`: String{
        guard let FilePath = Bundle.main.path(forResource: "Ai-info", ofType: "plist")
        else{
            fatalError("Unable to find 'Ai-info' file!")
        }
        
       let plist = NSDictionary(contentsOfFile: FilePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String
        else{
            fatalError("Unable to find key in 'Ai-info'")
        }
       // Api Key does not  start with '_' 
        if value.starts(with: "_"){
            fatalError("API Key is not correct!")
        }
        return value
    }
}
