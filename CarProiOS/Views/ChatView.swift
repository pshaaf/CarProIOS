//
//  ChatView.swift
//  CarProiOS
//
//  Sebastian chat interface with suggested prompts and canned responses
//

import SwiftUI

struct ChatView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var messages: [ChatMessage] = []
    @State private var inputText = ""
    @State private var showSuggestions = true
    
    private let suggestedPrompts = SuggestedPrompt.defaultPrompts
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerSection
            
            // Content
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: AppSpacing.lg) {
                        if showSuggestions {
                            suggestionsSection
                        }
                        
                        // Messages
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal, AppSpacing.xl)
                    .padding(.vertical, AppSpacing.lg)
                }
                .onChange(of: messages.count) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            // Input Area
            inputSection
        }
        .background(AppColors.backgroundRoot)
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        ZStack(alignment: .topTrailing) {
            // Gradient Background
            AppColors.headerGradient
            
            VStack(spacing: 0) {
                // Drag Indicator
                RoundedRectangle(cornerRadius: 2.5)
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 36, height: 5)
                    .padding(.top, AppSpacing.sm)
                
                // Title Row
                HStack(spacing: AppSpacing.md) {
                    Image("SebastianIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 77, height: 77)
                    
                    Text("How can Sebastian help today?")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(.horizontal, AppSpacing.xl)
                .padding(.top, AppSpacing.lg)
                .padding(.bottom, AppSpacing.xl)
            }
            
            // Close Button
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
            }
            .padding(.top, AppSpacing.md)
            .padding(.trailing, AppSpacing.lg)
        }
        .frame(height: 120)
    }
    
    // MARK: - Suggestions Section
    
    private var suggestionsSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("Suggested Questions")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(AppColors.textPrimary)
            
            ForEach(suggestedPrompts) { prompt in
                Button(action: {
                    selectPrompt(prompt)
                }) {
                    Text(prompt.prompt)
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, AppSpacing.lg)
                        .padding(.vertical, AppSpacing.md)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.sm))
                        .overlay(
                            RoundedRectangle(cornerRadius: AppBorderRadius.sm)
                                .stroke(AppColors.borderGray, lineWidth: 1)
                        )
                }
            }
        }
    }
    
    // MARK: - Input Section
    
    private var inputSection: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: AppSpacing.md) {
                TextField("Ask Anything", text: $inputText)
                    .font(.system(size: 16))
                    .padding(.horizontal, AppSpacing.lg)
                    .padding(.vertical, AppSpacing.md)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.lg))
                    .overlay(
                        RoundedRectangle(cornerRadius: AppBorderRadius.lg)
                            .stroke(AppColors.borderGray, lineWidth: 1)
                    )
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 18))
                        .foregroundColor(inputText.isEmpty ? AppColors.textTertiary : AppColors.turquoise)
                        .frame(width: 48, height: 48)
                        .background(AppColors.backgroundDefault)
                        .clipShape(Circle())
                }
                .disabled(inputText.isEmpty)
            }
            .padding(.horizontal, AppSpacing.xl)
            .padding(.vertical, AppSpacing.lg)
        }
        .background(Color.white)
    }
    
    // MARK: - Actions
    
    private func selectPrompt(_ prompt: SuggestedPrompt) {
        withAnimation {
            showSuggestions = false
        }
        
        // Add user message
        let userMessage = ChatMessage(text: prompt.prompt, isFromUser: true)
        messages.append(userMessage)
        
        // Add Sebastian's response after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                let botMessage = ChatMessage(text: prompt.response, isFromUser: false)
                messages.append(botMessage)
            }
        }
    }
    
    private func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        withAnimation {
            showSuggestions = false
        }
        
        let userMessage = ChatMessage(text: inputText, isFromUser: true)
        messages.append(userMessage)
        inputText = ""
        
        // Generic response for custom messages
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                let botMessage = ChatMessage(
                    text: "Thanks for your question! A member of our team will follow up with you shortly. Is there anything else I can help you with?",
                    isFromUser: false
                )
                messages.append(botMessage)
            }
        }
    }
}

// MARK: - Message Bubble

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isFromUser {
                Spacer(minLength: 60)
            }
            
            HStack(alignment: .top, spacing: AppSpacing.sm) {
                if !message.isFromUser {
                    Image("SebastianIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                }
                
                Text(message.text)
                    .font(.system(size: 14))
                    .foregroundColor(message.isFromUser ? .white : AppColors.textPrimary)
                    .padding(.horizontal, AppSpacing.md)
                    .padding(.vertical, AppSpacing.sm)
                    .background(
                        message.isFromUser
                            ? AppColors.blueGradientStart
                            : AppColors.backgroundDefault
                    )
                    .clipShape(RoundedRectangle(cornerRadius: AppBorderRadius.md))
            }
            
            if !message.isFromUser {
                Spacer(minLength: 60)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ChatView()
}

