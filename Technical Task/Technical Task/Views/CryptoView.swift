//
//  CryptoView.swift
//  Technical Task
//
//  Created by Rishabh Jain on 8/3/2025.
//
import SwiftUI

struct CryptoView: View {
  @StateObject private var viewModel = CryptoViewModel()

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        // Header
        Button(action: {}) {
          Image(systemName: "plus.circle")
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 30,height: 30)
            .padding(.leading)
        }

        Text("Crypto")
          .font(.largeTitle)
          .bold()
          .padding(.horizontal)
          .padding(.bottom)

        // Account Value
        Text("Account Value")
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.horizontal)

        Text("$11,542.21")
          .font(.largeTitle)
          .bold()
          .padding(.horizontal)

        // Send & Receive Buttons
        HStack {
          CryptoCapsuleButton(buttonText: "↑ Send") {
            //Send Button Action
          }
          CryptoCapsuleButton(buttonText: "↓ Receive") {
            //Receive Button Action
          }
        }
        .padding(.horizontal)

        // Crypto List
        List(viewModel.cryptos) { crypto in
          NavigationLink(destination: CryptoDetailView(crypto: crypto)) {
            CryptoRowView(crypto: crypto)
          }
        }
        .listStyle(PlainListStyle())
        .onAppear {
          viewModel.fetchCryptoPrices()
        }
      }
      .padding(.top)
    }
    .overlay(alignment: .bottom) {
      FloatingButtonsView ()
    }
  }
}

#Preview {
  CryptoView()
}
