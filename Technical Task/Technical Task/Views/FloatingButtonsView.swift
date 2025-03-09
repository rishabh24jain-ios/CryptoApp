//
//  FloatingMenue.swift
//  Technical Task
//
//  Created by Rishabh Jain on 10/3/2025.
//

import SwiftUI

struct FloatingButtonsView: View {
  @State private var selectedButton: ButtonType? = .bitcoin

  enum ButtonType {
    case bitcoin, swap, settings
  }

  var body: some View {
    ZStack {
      // Floating Buttons Container
      HStack(spacing: 20) {
        FloatingButton(icon: "bitcoinsign.circle.fill", isSelected: selectedButton == .bitcoin) {
          selectedButton = .bitcoin
        }

        FloatingButton(icon: "arrow.left.arrow.right", isSelected: selectedButton == .swap) {
          selectedButton = .swap
        }

        FloatingButton(icon:"gearshape", isSelected: selectedButton == .settings) {
          selectedButton = .settings
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 30)
          .fill(Color.gray.opacity(0.05))
          .foregroundColor(.white)
          .shadow(radius: 10)
      )
      .padding(.bottom, 20)
    }
  }
}

// Floating Button Component
struct FloatingButton: View {
  let icon: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Image(systemName: icon)
        .font(.title)
        .foregroundColor(isSelected ? .white : Color.gray)
        .frame(width: 50, height: 50)
        .background(isSelected ? Color.black : Color.gray.opacity(0.1))
        .clipShape(Circle())
        .shadow(radius: 5)
    }
  }
}

#Preview {
    FloatingButtonsView()
}
