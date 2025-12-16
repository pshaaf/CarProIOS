//
//  SearchBarView.swift
//  CarProiOS
//
//  Custom search bar component with GO button
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            // Search Input
            HStack(spacing: AppSpacing.sm) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.textTertiary)
                
                TextField("Search Make, Model, or Keyword", text: $searchText)
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.textPrimary)
                    .focused($isFocused)
            }
            .padding(.horizontal, AppSpacing.md)
            .frame(height: AppSpacing.inputHeight)
            .background(Color.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: AppBorderRadius.sm,
                    bottomLeadingRadius: AppBorderRadius.sm,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 0
                )
            )
            .overlay(
                UnevenRoundedRectangle(
                    topLeadingRadius: AppBorderRadius.sm,
                    bottomLeadingRadius: AppBorderRadius.sm,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 0
                )
                .stroke(isFocused ? AppColors.blueGradientStart : Color.clear, lineWidth: 2)
            )
            
            // GO Button
            Button(action: {
                isFocused = false
                onSearch()
            }) {
                Text("GO")
                    .sectionHeaderStyle()
                    .foregroundColor(.white)
                    .frame(width: 60, height: AppSpacing.inputHeight)
                    .background(AppColors.turquoise)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: AppBorderRadius.sm,
                            topTrailingRadius: AppBorderRadius.sm
                        )
                    )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        AppColors.headerGradient
            .ignoresSafeArea()
        
        SearchBarView(searchText: .constant(""), onSearch: {})
            .padding(.horizontal, AppSpacing.xl)
    }
}

