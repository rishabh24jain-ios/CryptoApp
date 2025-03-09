//
//  CryptoViewModel.swift
//  Technical Task
//
//  Created by Rishabh Jain on 8/3/2025.
//
import SwiftUI

class CryptoViewModel: ObservableObject {
  @Published var cryptos: [Crypto] = []

//We can make a different for api call as well
  func fetchCryptoPrices() {
    let endPoint = "markets?vs_currency=usd&order=market_cap_desc&per_page=5&page=1&sparkline=false"
    APIService.shared.fetchData(from: endPoint) { (result: Result<[Crypto], Error>) in
      switch result {
      case .success(let cryptos):
        self.cryptos = cryptos
      case .failure(let error):
        print("Error fetching data: \(error.localizedDescription)")
      }
    }
  }



}
