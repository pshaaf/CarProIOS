//
//  ExploreView.swift
//  CarProiOS
//
//  Main explore/home screen with vehicle browsing
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @State private var vehicles = MockData.vehicles
    @State private var selectedVehicle: Vehicle?
    @State private var showChat = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    // Header with Gradient
                    headerSection
                    
                    // Main Content
                    ScrollView {
                        VStack(alignment: .leading, spacing: AppSpacing.lg) {
                            // Recently Viewed Section
                            recentlyViewedSection
                            
                            // Saved Searches Section
                            savedSearchesSection
                        }
                        .padding(.top, AppSpacing.xl)
                        .padding(.bottom, 100) // Space for tab bar
                    }
                    .background(AppColors.backgroundRoot)
                }
                
                // Floating Chat Button
                AskSebastianButton(action: {
                    showChat = true
                })
                .padding(.trailing, AppSpacing.xl)
                .padding(.bottom, AppSpacing.xl)
            }
            .sheet(isPresented: $showChat) {
                ChatView()
            }
        }
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        ZStack {
            AppColors.headerGradient
                .ignoresSafeArea(edges: .top)
            
            VStack(spacing: 0) {
                // Greeting
                VStack(spacing: 0) {
                    Text("WELCOME BACK,")
                        .greetingStyle()
                        .foregroundColor(.white)
                    
                    Text("PAUL")
                        .greetingStyle()
                        .foregroundColor(.white)
                }
                .padding(.top, AppSpacing.lg)
                
                // Search Bar
                SearchBarView(searchText: $searchText) {
                    performSearch()
                }
                .padding(.horizontal, AppSpacing.xl)
                .padding(.top, AppSpacing.lg)
                .padding(.bottom, AppSpacing.xl)
            }
        }
        .frame(height: 180)
    }
    
    // MARK: - Recently Viewed Section
    
    private var recentlyViewedSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.lg) {
            Text("Recently Viewed")
                .sectionHeaderStyle()
                .foregroundColor(AppColors.textPrimary)
                .padding(.horizontal, AppSpacing.xl)
            
            VStack(spacing: AppSpacing.lg) {
                ForEach(Array(vehicles.enumerated()), id: \.element.id) { index, vehicle in
                    NavigationLink(destination: VehicleDetailView(vehicle: vehicle)) {
                        VehicleCard(
                            vehicle: vehicle,
                            onFavoriteToggle: {
                                toggleFavorite(at: index)
                            }
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, AppSpacing.xl)
        }
    }
    
    // MARK: - Saved Searches Section
    
    private var savedSearchesSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.lg) {
            Text("Saved Searches")
                .sectionHeaderStyle()
                .foregroundColor(AppColors.textPrimary)
                .padding(.horizontal, AppSpacing.xl)
            
            // Placeholder for saved searches
            Text("No saved searches yet")
                .bodyStyle()
                .foregroundColor(AppColors.textSecondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.xxxl)
        }
    }
    
    // MARK: - Actions
    
    private func performSearch() {
        // Handle search
        print("Searching for: \(searchText)")
    }
    
    private func toggleFavorite(at index: Int) {
        vehicles[index].isFavorite.toggle()
    }
}

// MARK: - Preview

#Preview {
    ExploreView()
}

