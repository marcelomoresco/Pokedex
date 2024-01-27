//
//  Helpers.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import Foundation

extension Bundle {
    func decode<T:Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find")
        }
        
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error")
        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError()
        }
        
        return loadedData
    }
    
    func fetchData<T:Decodable>(url:String, model:T.Type,completion: @escaping(T) -> (), failure: @escaping(Error)->()){
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            
            guard let data else {
                if let error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
        
    }
}
