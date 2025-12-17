//
//  AskSebastianButton.swift
//  CarProiOS
//
//  Custom "Ask Sebastian" chat button for vehicle detail page
//

import SwiftUI

struct AskSebastianButton: View {
    var action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.sm) {
                Image("SebastianIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 32)
                
                Text("Ask Sebastian")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, AppSpacing.lg)
            .frame(height: AppSpacing.chatButtonSize)
            .background(
                LinearGradient(
                    colors: [Color(hex: "1A1A2E"), Color(hex: "2D2D44")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(hex: "4A90E2").opacity(0.25),
                                Color(hex: "E24A8F").opacity(0.25)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 1
                    )
            )
            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 2)
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .opacity(isPressed ? 0.9 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        AppColors.backgroundDefault
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                AskSebastianButton(action: {})
                    .padding()
            }
        }
    }
}

