//
//  ChatButton.swift
//  CarProiOS
//
//  Floating chat button component
//

import SwiftUI

struct ChatButton: View {
    var action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(AppColors.navyBlue)
                    .frame(width: AppSpacing.chatButtonSize, height: AppSpacing.chatButtonSize)
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                
                Image(systemName: "message.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
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
                ChatButton(action: {})
                    .padding()
            }
        }
    }
}

