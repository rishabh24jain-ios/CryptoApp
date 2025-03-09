//
//  CryptoCasuleButton.swift
//  Technical Task
//
//  Created by Rishabh Jain on 10/3/2025.
//

import SwiftUI

struct CryptoCapsuleButton: View {
  let buttonText: String
  let action: () -> Void
    var body: some View {
      Button(action: {
        action()
      }) {
        Text(buttonText)
          .font(.headline)
          .padding(.horizontal, 25)
          .padding(.vertical)
          .frame(maxWidth: .infinity)
          .background(Color.black)
          .foregroundColor(.white)
          .clipShape(.capsule)
          .fixedSize()
      }
    }
}

#Preview {
  CryptoCapsuleButton(buttonText: "↑ Send", action: {

  })
}
