//
//  FavoritesView.swift
//  CarProiOS
//
//  Favorites screen - placeholder
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack {
            AppColors.backgroundRoot
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                SimpleTitleHeader(title: "FAVORITES")
                
                // Content
                VStack {
                    Spacer()
                    
                    Image(systemName: "heart")
                        .font(.system(size: 48))
                        .foregroundColor(AppColors.textTertiary)
                        .padding(.bottom, AppSpacing.lg)
                    
                    Text("Your favorited vehicles will appear here")
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
    FavoritesView()
}

