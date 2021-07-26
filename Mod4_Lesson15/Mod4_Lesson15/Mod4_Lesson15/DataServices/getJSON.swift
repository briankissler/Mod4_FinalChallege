//
//  getJSON.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/22/21.
//

import Foundation


class dataService {
    
    static func getLocalData() -> [Book] {
        
        var myError = ""
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
        
            do {
                
                myError = "DATA - "
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                myError = "DECODE - "
                let getData = try decoder.decode([Book].self, from: data)
                
               /* for r in getData {
                    
                    r.id = UUID()
                    
                    for i in r.ingredients{
                        
                        i.id = UUID()
                    }
                    
                }*/
 
                //self.myPizza = getData
                
                return getData
            }
            catch
            {
                print(myError)
                print(error)
            }
            
        
        
        }
        else
        {
            return [Book]()
        }
        
        return [Book]()
        
    }
    
}

enum DataError: Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}

class JSONParser {
    
    typealias result<T> = (Result<[T], Error>) -> Void
    
    func downloadList<T: Decodable>(of type: T.Type, from localJSON: String, completion: @escaping result<T>) {
        
        if let path = Bundle.main.path(forResource: localJSON, ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
            
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: [T] = try JSONDecoder().decode([T].self, from: data)
                        completion(.success(decodedData))
                    }
                    catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }

    }
    
}
