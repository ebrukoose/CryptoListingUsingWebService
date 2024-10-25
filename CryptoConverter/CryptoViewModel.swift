//
//  CryptoViewModel.swift
//  CryptoConverter
//
//  Created by EBRU KÖSE on 25.10.2024.
//

import Foundation


class CryptoListViewModel: ObservableObject{
    
    
    @Published var cryptoList = [CryptoViewModel]()
    
    
    let webService = WebService()
    func downloadCryptoList(url: URL){
        webService.downloadCurrencies(url: url) { result in
            
            switch result{
                
            case .success(let cryptos):
                if let cryptos = cryptos{
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                  
                }
                
            case .failure(let error ):
                print(error)
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
}






struct CryptoViewModel{
    var crypto: CryptoCurrency
    
    var id : UUID?{
        crypto.id
    }
    var currency: String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
}
