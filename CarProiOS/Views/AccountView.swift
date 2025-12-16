//
//  AccountView.swift
//  CarProiOS
//
//  Account screen - placeholder
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            AppColors.backgroundRoot
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                SimpleTitleHeader(title: "ACCOUNT")
                
                // Content
                VStack {
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .font(.system(size: 48))
                        .foregroundColor(AppColors.textTertiary)
                        .padding(.bottom, AppSpacing.lg)
                    
                    Text("Manage your profile and settings")
                        .bodyStyle()
                        .foregroundColor(AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .padding(.horizontal, AppSpacing.xl)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    AccountView()
}

