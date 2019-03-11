//
//  PersonController.swift
//  StarWars Search Swift-ObjC
//
//  Created by Iyin Raphael on 3/11/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

private let baseURL = URL(string: "https://swapi.co/api/people")!

class PersonController: NSObject {
    
    static let shared = PersonController()
    
    func searchForPeople(with searchTerm: String, completion: @escaping ([LSIPerson]?, Error?) -> Void) {
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        components.queryItems = [searchItem]
        let url = components.url!
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(nil, error)
            }
            guard let data = data else {
                return completion(nil, NSError())
            }
            do{
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let personDictionaries = dictionary["results"] as? [[String: Any]] else {
                    throw NSError()}
                let people = personDictionaries.compactMap{ LSIPerson(dictionary: $0)}
//                var people = [LSIPerson]() 
//                for dictioanry in personDictionaries {
//                    if let person = LSIPerson(dictionary: dictionary){
//                        people.append(person )
//                    }
//                }
                
            }catch{
                return completion(nil, error)
            }
            
        }.resume()
    }

}
