//
//  SellTradeView.swift
//  CarProiOS
//
//  Sell/Trade screen - placeholder
//

import SwiftUI

struct SellTradeView: View {
    var body: some View {
        ZStack {
            AppColors.backgroundRoot
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                SimpleTitleHeader(title: "SELL OR TRADE")
                
                // Content
                VStack {
                    Spacer()
                    
                    Image(systemName: "tag")
                        .font(.system(size: 48))
                        .foregroundColor(AppColors.textTertiary)
                        .padding(.bottom, AppSpacing.lg)
                    
                    Text("Sell or trade-in your vehicle")
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
    SellTradeView()
}

