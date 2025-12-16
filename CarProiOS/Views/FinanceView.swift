//
//  FinanceView.swift
//  CarProiOS
//
//  Finance screen - placeholder
//

import SwiftUI

struct FinanceView: View {
    var body: some View {
        ZStack {
            AppColors.backgroundRoot
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                SimpleTitleHeader(title: "FINANCE")
                
                // Content
                VStack {
                    Spacer()
                    
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 48))
                        .foregroundColor(AppColors.textTertiary)
                        .padding(.bottom, AppSpacing.lg)
                    
                    Text("Explore financing options and calculators")
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
    FinanceView()
}

