//
//  CryptoRowView.swift
//  Technical Task
//
//  Created by Rishabh Jain on 10/3/2025.
//

import SwiftUI

struct CryptoRowView: View {
  let crypto: Crypto
  
  var body: some View {
    // Crypto List
    HStack {
      AsyncImage(url: URL(string: crypto.image)) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
      .frame(width: 40, height: 40)
      .clipShape(Circle())
      
      VStack(alignment: .leading) {
        Text(crypto.name)
          .font(.headline)
        Text("$\(crypto.currentPrice, specifier: "%.2f")")
          .font(.subheadline)
          .foregroundColor(.gray)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Text("\(crypto.atl) \(crypto.symbol.uppercased())")
          .font(.headline)
        Text("$\(crypto.totalValue, specifier: "%.2f")")
          .font(.subheadline)
          .foregroundColor(.gray)
      }
    }
  }
}
