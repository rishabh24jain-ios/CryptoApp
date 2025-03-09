//
//  CryptoDetailsView.swift
//  Technical Task
//
//  Created by Rishabh Jain on 9/3/2025.
//
import SwiftUI

struct CryptoDetailView: View {
  let crypto: Crypto

  var body: some View {
    VStack {
      AsyncImage(url: URL(string: crypto.image)) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
      .frame(width: 100, height: 100)
      .clipShape(Circle())

      Text(crypto.name)
        .font(.largeTitle)
        .padding()
      Text("Current Price: ")
        .font(.title2)
    }
    .navigationTitle(crypto.name)
  }
}

