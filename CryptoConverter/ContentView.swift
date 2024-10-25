//
//  ContentView.swift
//  CryptoConverter
//
//  Created by EBRU KÖSE on 22.10.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CryptoListViewModel
    init(){
        self.viewModel = CryptoListViewModel()
    }
    var body: some View {
        NavigationView{
            
            List(viewModel.cryptoList, id:\.id ){
                crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    
                        
                    Text(crypto.price)
                        .font(.headline)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
              
            }.navigationTitle("Crypto Listesi")
        }.onAppear{
            viewModel.downloadCryptoList(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
