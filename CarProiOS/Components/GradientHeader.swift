//
//  GradientHeader.swift
//  CarProiOS
//
//  Reusable blue gradient header component
//

import SwiftUI

struct GradientHeader<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            AppColors.headerGradient
                .ignoresSafeArea(edges: .top)
            
            content
        }
    }
}

// MARK: - Simple Title Header

struct SimpleTitleHeader: View {
    let title: String
    
    var body: some View {
        GradientHeader {
            VStack {
                Text(title)
                    .greetingStyle()
                    .foregroundColor(.white)
                    .padding(.top, AppSpacing.lg)
                    .padding(.bottom, AppSpacing.xl)
            }
        }
        .frame(height: 120)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 0) {
        SimpleTitleHeader(title: "FAVORITES")
        
        Spacer()
    }
    .background(AppColors.backgroundRoot)
}

