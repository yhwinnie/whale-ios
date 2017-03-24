//
//  LoginAPI.swift
//  whale-ios-winnie
//
//  Created by Winnie Wen on 3/22/17.
//  Copyright © 2017 wiwen. All rights reserved.
//

import Foundation
import Alamofire
import KeychainAccess

class LoginAPI {
    
    //    email: String password: String
    
    let loginUserURLString = "https://whale2-elixir.herokuapp.com/api/v1/sessions"
    func userLogin(email: String, password: String, callback:@escaping ((Int) -> Void)) {
        let parameters = ["email": email, "password": password]
        
        
        Alamofire.request(loginUserURLString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                
                guard let response = response.response else {
                    return
                }
                
                if response.statusCode == 200 {
                   
                    let headers = response.allHeaderFields as! [String: Any]
                    
                    
                    guard let authorizationToken = headers["Authorization"] as? String else {
                        print("No authorization code")
                        return
                    }
                    
                    let keychain = Keychain(service: "com.wiwen.whale-ios-winnie")
                    
                    do {
                        
                        try keychain.set(authorizationToken, key: "token")
                        
                        callback(response.statusCode)

                        
                    } catch let error {
                        print("error: \(error)")
                    }
                }
        }
    }
}

