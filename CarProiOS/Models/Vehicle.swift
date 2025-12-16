//
//  Vehicle.swift
//  CarProiOS
//
//  Vehicle data model
//

import Foundation

struct Vehicle: Identifiable, Equatable {
    let id: String
    let year: Int
    let make: String
    let model: String
    let trim: String
    let price: Int
    let imageName: String
    var isFavorite: Bool
    var purchaseInProgress: Bool
    let mileage: Int
    let bodyStyle: String
    
    // Computed properties
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: price)) ?? "$\(price)"
    }
    
    var titleText: String {
        "\(year) \(make) \(model)"
    }
    
    var subtitleText: String {
        "\(trim) \(bodyStyle) · \(formattedMileage)"
    }
    
    var formattedMileage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: mileage)) ?? "\(mileage)") miles"
    }
}

// MARK: - Feature Card Model

struct FeatureCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

// MARK: - FAQ Question Model

struct FAQQuestion: Identifiable {
    let id = UUID()
    let question: String
}

