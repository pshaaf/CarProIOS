//
//  ContentView.swift
//  CarProiOS
//
//  Main TabView container with 5 tabs
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Explore Tab
            ExploreView()
                .tabItem {
                    Label("EXPLORE", systemImage: "magnifyingglass")
                }
                .tag(0)
            
            // Sell/Trade Tab
            SellTradeView()
                .tabItem {
                    Label("SELL/TRADE", systemImage: "tag")
                }
                .tag(1)
            
            // Finance Tab
            FinanceView()
                .tabItem {
                    Label("FINANCE", systemImage: "building.columns")
                }
                .tag(2)
            
            // Favorites Tab
            FavoritesView()
                .tabItem {
                    Label("FAVORITES", systemImage: "heart")
                }
                .tag(3)
            
            // Account Tab
            AccountView()
                .tabItem {
                    Label("ACCOUNT", systemImage: "person")
                }
                .tag(4)
        }
        .tint(AppColors.blueGradientStart)
        .onAppear {
            setupTabBarAppearance()
        }
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        // Configure tab bar item appearance
        let itemAppearance = UITabBarItemAppearance()
        
        // Normal state
        itemAppearance.normal.iconColor = UIColor(AppColors.textTertiary)
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(AppColors.textTertiary),
            .font: UIFont.systemFont(ofSize: 11)
        ]
        
        // Selected state
        itemAppearance.selected.iconColor = UIColor(AppColors.blueGradientStart)
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(AppColors.blueGradientStart),
            .font: UIFont.systemFont(ofSize: 11)
        ]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

