//
//  VehicleCard.swift
//  CarProiOS
//
//  Reusable vehicle card component
//

import SwiftUI

struct VehicleCard: View {
    let vehicle: Vehicle
    let onFavoriteToggle: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            // Vehicle Image with Favorite Button
            ZStack(alignment: .topLeading) {
                // Vehicle Image
                Image(vehicle.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: AppSpacing.cardImageSize, height: AppSpacing.cardImageSize)
                    .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.sm))
                    .background(
                        RoundedRectangle(cornerRadius: AppBorderRadius.sm)
                            .fill(AppColors.backgroundDefault)
                    )
                
                // Favorite Button
                Button(action: onFavoriteToggle) {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.3))
                            .frame(width: 32, height: 32)
                        
                        Image(systemName: vehicle.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 16))
                            .foregroundColor(vehicle.isFavorite ? AppColors.turquoise : .white)
                    }
                }
                .padding(AppSpacing.sm)
            }
            
            // Vehicle Details
            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                // Purchase Badge
                if vehicle.purchaseInProgress {
                    Text("Purchase in Progress")
                        .badgeStyle()
                        .foregroundColor(.white)
                        .padding(.horizontal, AppSpacing.sm)
                        .padding(.vertical, AppSpacing.xs)
                        .background(AppColors.badgeRed)
                        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.xs))
                }
                
                // Title
                Text("\(vehicle.year) \(vehicle.make) \(vehicle.model)...")
                    .vehiclePrimaryStyle()
                    .foregroundColor(AppColors.textPrimary)
                    .lineLimit(1)
                
                // Trim
                Text(vehicle.trim)
                    .vehicleSecondaryStyle()
                    .foregroundColor(AppColors.textSecondary)
                    .lineLimit(1)
                
                // Price
                Text(vehicle.formattedPrice)
                    .priceStyle()
                    .foregroundColor(AppColors.textPrimary)
                    .padding(.top, AppSpacing.xs)
            }
            
            Spacer()
            
            // Chevron
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppColors.turquoise)
        }
        .padding(AppSpacing.lg)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.md))
        .cardShadow()
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .opacity(isPressed ? 0.9 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
    }
    
    func onPressChanged(_ pressed: Bool) -> VehicleCard {
        var copy = self
        copy._isPressed = State(initialValue: pressed)
        return copy
    }
}

// MARK: - Preview

#Preview {
    VStack {
        VehicleCard(
            vehicle: MockData.vehicles[0],
            onFavoriteToggle: {}
        )
        
        VehicleCard(
            vehicle: MockData.vehicles[1],
            onFavoriteToggle: {}
        )
    }
    .padding()
    .background(AppColors.backgroundDefault)
}

