//
//  MockData.swift
//  CarProiOS
//
//  Mock vehicle data for the app
//

import Foundation

struct MockData {
    static let vehicles: [Vehicle] = [
        Vehicle(
            id: "1",
            year: 2025,
            make: "Toyota",
            model: "Land Cruiser",
            trim: "1958",
            price: 60990,
            imageName: "toyota_land_cruiser",
            isFavorite: true,
            purchaseInProgress: true,
            mileage: 12500,
            bodyStyle: "SUV"
        ),
        Vehicle(
            id: "2",
            year: 2024,
            make: "Volvo",
            model: "XC60",
            trim: "B5 Core Dark Theme",
            price: 32590,
            imageName: "volvo_xc60_silver",
            isFavorite: false,
            purchaseInProgress: false,
            mileage: 20445,
            bodyStyle: "Sport Utility 4D"
        ),
        Vehicle(
            id: "3",
            year: 2023,
            make: "Volvo",
            model: "XC60",
            trim: "T8 Recharge Core",
            price: 36590,
            imageName: "volvo_xc60_white",
            isFavorite: true,
            purchaseInProgress: false,
            mileage: 15200,
            bodyStyle: "Sport Utility 4D"
        )
    ]
    
    static let featureCards: [FeatureCard] = [
        FeatureCard(
            title: "Capable & efficient AWD",
            description: "Provides confident all-weather capability and responsive performance through its 2.0L turbocharged I4 B5 mild hybrid engine, 8-speed Geartronic..."
        ),
        FeatureCard(
            title: "Panoramic moonroof",
            description: "Brightens the cabin with an open, airy feel through its front and rear glass panels..."
        ),
        FeatureCard(
            title: "Advanced safety systems",
            description: "Includes collision avoidance, blind spot monitoring, and adaptive cruise control for confident driving..."
        ),
        FeatureCard(
            title: "Premium sound system",
            description: "Harman Kardon premium audio delivers immersive sound quality throughout the cabin..."
        )
    ]
    
    static let faqQuestions: [FAQQuestion] = [
        FAQQuestion(question: "What safety features come standard on this XC60 B5 Core?"),
        FAQQuestion(question: "How does the dark theme trim enhance this vehicle's style?"),
        FAQQuestion(question: "Does this XC60 offer wireless smartphone integration?"),
        FAQQuestion(question: "How does the cargo space compare to similar SUVs?")
    ]
    
    // Price comparison data
    static let kbbPrice: Int = 35054
    
    // Delivery info
    static let pickupLocation = "Westminster, CA"
    static let deliveryLocation = "Santa Monica, CA"
    static let deliveryEstimate = "Thursday"
}

