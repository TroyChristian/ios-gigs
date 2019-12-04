//
//  GigController.swift
//  gigs
//
//  Created by Lambda_School_Loaner_219 on 12/4/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation

enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
class GigController{
    var bearer:Bearer?
    let baseURL = URL(string: "https://lambdagigs.vapor.cloud/api")
    
    /// Sign up: /users/signup
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        guard let url = baseURL else {return}
        let signUpURL = url.appendingPathComponent("users/signup")
        var request = URLRequest(url:signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        do{
            let data = try encoder.encode(user)
            request.httpBody = data
            
        } catch let encodeError {
            print("Error encoding user obect \(encodeError)")
            completion(encodeError)
            return
        
    }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            
            if let response = response  as? HTTPURLResponse, response.statusCode != 200 {
                completion(NSError(domain:"", code: response.statusCode, userInfo:nil))
                return
            }
            
            DispatchQueue.main.async {
                completion(nil) 
            }
            
        }.resume()
    
    /// log in /users/login
    
    
}
}
