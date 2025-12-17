//
//  ChatMessage.swift
//  CarProiOS
//
//  Chat message and suggested prompt models
//

import Foundation

struct ChatMessage: Identifiable, Equatable {
    let id: UUID
    let text: String
    let isFromUser: Bool
    let timestamp: Date
    
    init(id: UUID = UUID(), text: String, isFromUser: Bool, timestamp: Date = Date()) {
        self.id = id
        self.text = text
        self.isFromUser = isFromUser
        self.timestamp = timestamp
    }
}

struct SuggestedPrompt: Identifiable {
    let id: UUID
    let prompt: String
    let response: String
    
    init(id: UUID = UUID(), prompt: String, response: String) {
        self.id = id
        self.prompt = prompt
        self.response = response
    }
    
    static let defaultPrompts: [SuggestedPrompt] = [
        SuggestedPrompt(
            prompt: "Is this car a good fit for my budget and lifestyle?",
            response: "Based on your browsing history and this vehicle's price point, it aligns well with what you've been looking at. The monthly payment would be around $485 with standard financing. It's a practical choice for daily commuting with enough cargo space for weekend adventures."
        ),
        SuggestedPrompt(
            prompt: "How does this car compare to similar options I've viewed?",
            response: "Compared to the other vehicles you've viewed, this one offers better fuel efficiency and a lower price point. It has similar safety ratings but includes more standard tech features. The main trade-off is slightly less cargo space than the larger SUVs you looked at."
        ),
        SuggestedPrompt(
            prompt: "What are the main reasons people choose this car?",
            response: "Buyers love this model for its reliability record, comfortable ride quality, and strong resale value. The brand consistently ranks high in owner satisfaction surveys, and this trim level hits the sweet spot between features and value."
        ),
        SuggestedPrompt(
            prompt: "What concerns should I think about before buying this car?",
            response: "A few things to consider: the back seat can feel snug for taller passengers, and the infotainment system has a learning curve. Also, premium fuel is recommended for optimal performance. Otherwise, this model has an excellent track record with minimal reported issues."
        ),
        SuggestedPrompt(
            prompt: "Is this a good deal compared to market prices?",
            response: "Yes! This vehicle is priced $2,400 below the Kelley Blue Book average for similar models in your area. Given its mileage and condition, you're looking at a strong value. Prices for this model have been trending up, so now is a good time to buy."
        ),
        SuggestedPrompt(
            prompt: "Based on what I've looked at, should I move forward with this car?",
            response: "Based on your preferences and browsing patterns, this vehicle checks most of your boxes. It fits your budget, has the features you've been drawn to, and is priced competitively. If you're ready, I'd recommend scheduling a test drive or starting the purchase process to lock in this price."
        )
    ]
}

