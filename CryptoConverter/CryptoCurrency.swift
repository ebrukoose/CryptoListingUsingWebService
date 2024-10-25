//
//  CryptoCurrency.swift
//  CryptoConverter
//
//  Created by EBRU KÖSE on 22.10.2024.
//

import Foundation
import SwiftUI
import UIKit
struct CryptoCurrency: Decodable, Identifiable{
    
    var id = UUID()
    let currency : String
    let price : String
    
    
    
    private  enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price =  "price"
        
    }
    
}
