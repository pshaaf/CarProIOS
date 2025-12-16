//
//  VehicleDetailView.swift
//  CarProiOS
//
//  Comprehensive vehicle detail screen
//

import SwiftUI

struct VehicleDetailView: View {
    let vehicle: Vehicle
    
    @State private var selectedTab = "Exterior"
    @State private var isFavorite: Bool
    @Environment(\.dismiss) private var dismiss
    
    private let tabs = ["Exterior", "Interior", "Key features"]
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
        _isFavorite = State(initialValue: vehicle.isFavorite)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    // Hero Image with Hotspots
                    heroImageSection
                    
                    // Tab Pills
                    tabPillsSection
                    
                    // Vehicle Info
                    vehicleInfoSection
                    
                    // Thumbnail Gallery
                    thumbnailGallery
                    
                    // Why You'll Love This
                    whyYouLoveSection
                    
                    // Feature Cards
                    featureCardsSection
                    
                    // Rear Image
                    rearImageSection
                    
                    // FAQ Section
                    faqSection
                    
                    // About the Price
                    priceSection
                    
                    // Pickup and Delivery
                    deliverySection
                    
                    // More to Love
                    moreToLoveSection
                    
                    Spacer(minLength: 120)
                }
            }
            .background(AppColors.backgroundRoot)
            
            // Bottom CTA
            bottomCTASection
            
            // Floating Chat Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ChatButton(action: {})
                        .padding(.trailing, AppSpacing.xl)
                        .padding(.bottom, 100)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(AppColors.blueGradientStart, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(vehicle.titleText)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: AppSpacing.md) {
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                    }
                    
                    Button(action: { isFavorite.toggle() }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Hero Image Section
    
    private var heroImageSection: some View {
        ZStack {
            Rectangle()
                .fill(AppColors.backgroundDefault)
                .frame(height: 280)
            
            Image(vehicle.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
            
            // Hotspots
            Group {
                hotspot
                    .position(x: UIScreen.main.bounds.width * 0.41, y: 70)
                hotspot
                    .position(x: UIScreen.main.bounds.width * 0.71, y: 126)
                hotspot
                    .position(x: UIScreen.main.bounds.width * 0.32, y: 154)
            }
        }
    }
    
    private var hotspot: some View {
        ZStack {
            Circle()
                .fill(AppColors.blueGradientStart.opacity(0.3))
                .frame(width: 28, height: 28)
            
            Circle()
                .fill(AppColors.blueGradientStart)
                .frame(width: 12, height: 12)
        }
    }
    
    // MARK: - Tab Pills Section
    
    private var tabPillsSection: some View {
        HStack(spacing: AppSpacing.sm) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    Text(tab)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(selectedTab == tab ? .white : AppColors.textPrimary)
                        .padding(.horizontal, AppSpacing.lg)
                        .padding(.vertical, AppSpacing.sm)
                        .background(
                            Capsule()
                                .fill(selectedTab == tab ? AppColors.blueGradientStart : AppColors.backgroundDefault)
                        )
                }
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.textPrimary)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(AppColors.backgroundDefault))
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.md)
    }
    
    // MARK: - Vehicle Info Section
    
    private var vehicleInfoSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            // Great Deal Badge
            Text("Great Deal")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, AppSpacing.md)
                .padding(.vertical, AppSpacing.xs)
                .background(AppColors.priceGreen)
                .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.xs))
            
            // Title
            Text(vehicle.titleText)
                .largeTitleStyle()
                .foregroundColor(AppColors.textPrimary)
            
            // Subtitle
            Text(vehicle.subtitleText)
                .font(.system(size: 14))
                .foregroundColor(AppColors.textSecondary)
            
            // Price
            Text(vehicle.formattedPrice)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(AppColors.textPrimary)
                .padding(.top, AppSpacing.sm)
            
            // Shipping Info
            Text("Free shipping · Get it \(MockData.deliveryEstimate)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(AppColors.turquoise)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, AppSpacing.xl)
        .padding(.top, AppSpacing.md)
    }
    
    // MARK: - Thumbnail Gallery
    
    private var thumbnailGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppSpacing.md) {
                ForEach(0..<3) { _ in
                    Image(vehicle.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.sm))
                        .background(
                            RoundedRectangle(cornerRadius: AppBorderRadius.sm)
                                .fill(AppColors.backgroundDefault)
                        )
                }
            }
            .padding(.horizontal, AppSpacing.xl)
        }
        .padding(.top, AppSpacing.xl)
    }
    
    // MARK: - Why You'll Love Section
    
    private var whyYouLoveSection: some View {
        VStack(spacing: AppSpacing.lg) {
            sectionDivider
            
            Text("Why You'll Love This XC60")
                .largeTitleStyle()
                .foregroundColor(AppColors.textPrimary)
                .multilineTextAlignment(.center)
            
            Text("As the entry point to the XC60 lineup, the B5 Core Dark Theme focuses on modern essentials with a crisp 12.3-inch digital driver display, seamless Apple CarPlay and Android Auto integration, and LED headlights with adaptive bending and automatic high beam for confident night driving.")
                .bodyStyle()
                .foregroundColor(AppColors.textSecondary)
                .lineSpacing(4)
        }
        .padding(.horizontal, AppSpacing.xl)
        .padding(.top, AppSpacing.xl)
    }
    
    // MARK: - Feature Cards Section
    
    private var featureCardsSection: some View {
        VStack(spacing: AppSpacing.xl) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppSpacing.md) {
                    ForEach(MockData.featureCards) { feature in
                        featureCard(feature)
                    }
                }
                .padding(.horizontal, AppSpacing.xl)
            }
            
            // Pagination Dots
            HStack(spacing: AppSpacing.sm) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 0 ? AppColors.blueGradientStart : AppColors.backgroundSecondary)
                        .frame(width: 8, height: 8)
                }
            }
        }
        .padding(.top, AppSpacing.xl)
    }
    
    private func featureCard(_ feature: FeatureCard) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            Text(feature.title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(AppColors.textPrimary)
            
            Text(feature.description)
                .font(.system(size: 14))
                .foregroundColor(AppColors.textSecondary)
                .lineSpacing(3)
            
            Button(action: {}) {
                Text("Show more")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(AppColors.textPrimary)
                    .underline()
            }
        }
        .padding(AppSpacing.lg)
        .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.md))
        .cardShadow()
    }
    
    // MARK: - Rear Image Section
    
    private var rearImageSection: some View {
        ZStack {
            Rectangle()
                .fill(AppColors.backgroundDefault)
            
            Image(vehicle.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 200)
        .padding(.top, AppSpacing.xl)
    }
    
    // MARK: - FAQ Section
    
    private var faqSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.lg) {
            HStack(spacing: AppSpacing.sm) {
                Image(systemName: "safari")
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.textPrimary)
                
                Text("Looking for specific vehicle info?")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.textPrimary)
            }
            
            VStack(spacing: AppSpacing.md) {
                ForEach(MockData.faqQuestions) { faq in
                    Button(action: {}) {
                        Text(faq.question)
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.turquoise)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.vertical, AppSpacing.md)
                            .background(AppColors.backgroundDefault)
                            .clipShape(Capsule())
                    }
                }
            }
            
            Button(action: {}) {
                Text("Ask something else")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, AppSpacing.xl)
                    .padding(.vertical, AppSpacing.md)
                    .background(AppColors.blueGradientStart)
                    .clipShape(Capsule())
            }
            .padding(.top, AppSpacing.sm)
        }
        .padding(.horizontal, AppSpacing.xl)
        .padding(.top, AppSpacing.xl)
    }
    
    // MARK: - Price Section
    
    private var priceSection: some View {
        VStack(spacing: AppSpacing.lg) {
            sectionDivider
            
            Text("About the Price")
                .largeTitleStyle()
                .foregroundColor(AppColors.textPrimary)
                .multilineTextAlignment(.center)
            
            // Price Card
            VStack(alignment: .leading, spacing: AppSpacing.lg) {
                Text("Great Deal")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, AppSpacing.md)
                    .padding(.vertical, AppSpacing.xs)
                    .background(AppColors.priceGreen)
                    .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.xs))
                
                Text("This vehicle is priced $\(MockData.kbbPrice - vehicle.price) lower than the Kelley Blue Book Typical Listing Price.")
                    .bodyStyle()
                    .foregroundColor(AppColors.textPrimary)
                
                // KBB Price
                HStack {
                    Text("Kelley Blue Book®")
                        .bodyStyle()
                        .foregroundColor(AppColors.textPrimary)
                    Spacer()
                    Text("$\(MockData.kbbPrice.formatted())")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(AppColors.textPrimary)
                }
                .padding(.vertical, AppSpacing.md)
                .overlay(
                    Rectangle()
                        .fill(AppColors.backgroundDefault)
                        .frame(height: 1),
                    alignment: .bottom
                )
                
                // Carvana Price
                HStack {
                    HStack(spacing: AppSpacing.sm) {
                        Circle()
                            .fill(AppColors.blueGradientStart)
                            .frame(width: 28, height: 28)
                            .overlay(
                                Image(systemName: "car.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            )
                        
                        Text("Carvana")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppColors.textPrimary)
                    }
                    Spacer()
                    Text(vehicle.formattedPrice)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(AppColors.textPrimary)
                }
                .padding(AppSpacing.lg)
                .background(AppColors.backgroundDefault)
                .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.sm))
                
                Text("Savings amount based on the difference between Kelley Blue Book® Typical Listing Price and current Carvana listing price, not including tax, title, registration or delivery costs.")
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.textTertiary)
                    .lineSpacing(2)
            }
            .padding(AppSpacing.lg)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.md))
            .cardShadow()
        }
        .padding(.horizontal, AppSpacing.xl)
        .padding(.vertical, AppSpacing.xl)
        .background(AppColors.backgroundLight)
    }
    
    // MARK: - Delivery Section
    
    private var deliverySection: some View {
        VStack(spacing: AppSpacing.lg) {
            sectionDivider
            
            Text("Pickup and Delivery")
                .largeTitleStyle()
                .foregroundColor(AppColors.textPrimary)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .top, spacing: AppSpacing.sm) {
                deliveryCard(
                    title: "Pickup \(MockData.deliveryEstimate)",
                    description: "Pick it up from our Westminster location",
                    location: MockData.pickupLocation
                )
                
                Text("or")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.textSecondary)
                    .padding(.top, 60)
                
                deliveryCard(
                    title: "Delivery \(MockData.deliveryEstimate)",
                    description: "Delivered to you within 2 days",
                    location: MockData.deliveryLocation
                )
            }
        }
        .padding(.horizontal, AppSpacing.xl)
        .padding(.top, AppSpacing.xl)
    }
    
    private func deliveryCard(title: String, description: String, location: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .fill(AppColors.backgroundDefault)
                .frame(height: 100)
                .overlay(
                    Image(vehicle.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .clipped()
            
            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(AppColors.textPrimary)
                
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.textSecondary)
                    .lineSpacing(2)
                
                Text(location)
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.turquoise)
                    .underline()
            }
            .padding(AppSpacing.md)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.md))
    }
    
    // MARK: - More to Love Section
    
    private var moreToLoveSection: some View {
        VStack(spacing: AppSpacing.lg) {
            sectionDivider
            
            Text("More to Love")
                .largeTitleStyle()
                .foregroundColor(AppColors.textPrimary)
                .multilineTextAlignment(.center)
            
            Text("Highlights")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(AppColors.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, AppSpacing.xl)
        .padding(.vertical, AppSpacing.xl)
        .background(AppColors.backgroundLight)
    }
    
    // MARK: - Bottom CTA Section
    
    private var bottomCTASection: some View {
        VStack {
            Button(action: {}) {
                Text("Continue purchase")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: AppSpacing.buttonHeight)
                    .background(AppColors.priceGreen)
                    .clipShape(Capsule())
            }
            .padding(.horizontal, AppSpacing.xl)
            .padding(.top, AppSpacing.md)
            .padding(.bottom, AppSpacing.xl)
        }
        .background(
            Color.white
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: -2)
        )
    }
    
    // MARK: - Section Divider
    
    private var sectionDivider: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(AppColors.orange)
            .frame(width: 32, height: 4)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        VehicleDetailView(vehicle: MockData.vehicles[1])
    }
}

