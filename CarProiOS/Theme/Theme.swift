//
//  Theme.swift
//  CarProiOS
//
//  Design system with colors, typography, and spacing
//

import SwiftUI

// MARK: - Color Extension for Hex Support

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - App Colors

struct AppColors {
    // Primary Colors
    static let blueGradientStart = Color(hex: "4A90E2")
    static let blueGradientEnd = Color(hex: "5BA3F5")
    static let turquoise = Color(hex: "17A2B8")
    static let priceGreen = Color(hex: "2C7A3B")
    static let badgeRed = Color(hex: "D32F2F")
    static let orange = Color(hex: "F5A623")
    static let navyBlue = Color(hex: "1E3A5F")
    
    // Text Colors
    static let textPrimary = Color(hex: "333333")
    static let textSecondary = Color(hex: "666666")
    static let textTertiary = Color(hex: "999999")
    
    // Background Colors
    static let backgroundRoot = Color.white
    static let backgroundDefault = Color(hex: "F2F2F2")
    static let backgroundSecondary = Color(hex: "E6E6E6")
    static let backgroundTertiary = Color(hex: "D9D9D9")
    static let backgroundLight = Color(hex: "E8F4F8")
    
    // Other
    static let borderGray = Color(hex: "CCCCCC")
    static let cardShadow = Color.black.opacity(0.08)
    static let tabBarBorder = Color.black.opacity(0.1)
    
    // Gradients
    static let headerGradient = LinearGradient(
        colors: [blueGradientStart, blueGradientEnd],
        startPoint: .top,
        endPoint: .bottom
    )
}

// MARK: - Spacing

struct AppSpacing {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
    static let xl: CGFloat = 20
    static let xxl: CGFloat = 24
    static let xxxl: CGFloat = 32
    static let xxxxl: CGFloat = 40
    static let xxxxxl: CGFloat = 48
    
    // Component specific
    static let inputHeight: CGFloat = 50
    static let buttonHeight: CGFloat = 52
    static let cardImageSize: CGFloat = 100
    static let headerHeight: CGFloat = 200
    static let chatButtonSize: CGFloat = 56
    static let tabBarHeight: CGFloat = 85
}

// MARK: - Border Radius

struct AppBorderRadius {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 24
    static let xl: CGFloat = 30
    static let xxl: CGFloat = 40
    static let full: CGFloat = 9999
}

// MARK: - Typography

struct AppTypography {
    // Greeting
    static let greetingSize: CGFloat = 24
    static let greetingWeight: Font.Weight = .bold
    
    // Section Headers
    static let sectionHeaderSize: CGFloat = 16
    static let sectionHeaderWeight: Font.Weight = .bold
    
    // Vehicle Card
    static let vehiclePrimarySize: CGFloat = 14
    static let vehiclePrimaryWeight: Font.Weight = .semibold
    static let vehicleSecondarySize: CGFloat = 12
    static let vehicleSecondaryWeight: Font.Weight = .regular
    
    // Price
    static let priceSize: CGFloat = 16
    static let priceWeight: Font.Weight = .bold
    
    // Badge
    static let badgeSize: CGFloat = 10
    static let badgeWeight: Font.Weight = .bold
    
    // Tab Label
    static let tabLabelSize: CGFloat = 11
    static let tabLabelWeight: Font.Weight = .regular
    
    // Large Title
    static let largeTitleSize: CGFloat = 22
    static let largeTitleWeight: Font.Weight = .bold
    
    // Body
    static let bodySize: CGFloat = 15
    static let bodyWeight: Font.Weight = .regular
}

// MARK: - Font Modifiers

extension View {
    func greetingStyle() -> some View {
        self.font(.system(size: AppTypography.greetingSize, weight: AppTypography.greetingWeight))
    }
    
    func sectionHeaderStyle() -> some View {
        self.font(.system(size: AppTypography.sectionHeaderSize, weight: AppTypography.sectionHeaderWeight))
    }
    
    func vehiclePrimaryStyle() -> some View {
        self.font(.system(size: AppTypography.vehiclePrimarySize, weight: AppTypography.vehiclePrimaryWeight))
    }
    
    func vehicleSecondaryStyle() -> some View {
        self.font(.system(size: AppTypography.vehicleSecondarySize, weight: AppTypography.vehicleSecondaryWeight))
    }
    
    func priceStyle() -> some View {
        self.font(.system(size: AppTypography.priceSize, weight: AppTypography.priceWeight))
    }
    
    func badgeStyle() -> some View {
        self.font(.system(size: AppTypography.badgeSize, weight: AppTypography.badgeWeight))
    }
    
    func largeTitleStyle() -> some View {
        self.font(.system(size: AppTypography.largeTitleSize, weight: AppTypography.largeTitleWeight))
    }
    
    func bodyStyle() -> some View {
        self.font(.system(size: AppTypography.bodySize, weight: AppTypography.bodyWeight))
    }
}

// MARK: - Shadow Modifier

extension View {
    func cardShadow() -> some View {
        self.shadow(color: AppColors.cardShadow, radius: 4, x: 0, y: 2)
    }
}

