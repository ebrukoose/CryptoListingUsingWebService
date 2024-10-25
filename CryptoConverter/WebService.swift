//
//  WebService.swift
//  CryptoConverter
//
//  Created by EBRU KÖSE on 22.10.2024.
//

import Foundation

class WebService{
    
    func downloadCurrencies(url: URL, completion: @escaping (Result <[CryptoCurrency]?, DownloaderError>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            guard let data = data , error == nil else {
                return  completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
        }.resume()
    }
    
    
    

}
enum DownloaderError: Error{
    case badURL
    case noData
    case dataParseError
}
