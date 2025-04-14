//
//  FeedbackVIew.swift
//  Created by GaliSrikanth on 11/04/25.

import SwiftUI

struct FeedbackView: View {
    @State private var feedbackOptions = [
        FeedbackOption(icon: "Awful", color: .red),
        FeedbackOption(icon: "Bad", color: .yellow),
        FeedbackOption(icon: "Good", color: .mint),
        FeedbackOption(icon: "Excellent", color: .blue)
    ]
    @State var selectedOption: UUID? = nil
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("How was your experience")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Your feedback helps us improve our service")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 20) {
                ForEach(feedbackOptions.prefix(3)) { feed in
                    feedbackButton(for: feed)
                }
            }
            
            if let lastFeed = feedbackOptions.last {
                feedbackButton(for: lastFeed)
            }
        }
        
    }
    
    @ViewBuilder
    private func feedbackButton(for feed: FeedbackOption) -> some View {
        HStack {
            Image(feed.icon)
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
                .foregroundStyle(feed.color)
            
            Text(feed.icon)
        }
        .padding(.horizontal)
        .frame(height: 54)
        .overlay {
            Capsule()
                .stroke(lineWidth: 1.5)
                .foregroundStyle(feed.id == selectedOption ? Color.primary : .clear)
        }
        .background(feed.color.opacity(0.15), in: Capsule())
        .animation(.linear, value: selectedOption)
        .onTapGesture {
            selectedOption = (selectedOption == feed.id) ? nil : feed.id
        }
    }
}

struct FeedbackTow: View {
    @State private var feedbackOptions = [
        FeedbackOption(icon: "Awful"),
        FeedbackOption(icon: "Bad"),
        FeedbackOption(icon: "Good"),
        FeedbackOption(icon: "Excellent")
    ]
    @State var selectedOption: UUID? = nil
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("How was your experience")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Your feedback helps us improve our service")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 20) {
                ForEach(feedbackOptions) { feed in
                    HStack {
                        Image(feed.icon)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(feed.id == selectedOption ? .LD : .DL)
                        
                        if feed.id == selectedOption {
                            Text(feed.icon)
                                .foregroundStyle(.LD)
                                .transition(.scale(scale: 0, anchor: .trailing))
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 54)
                    .frame(maxWidth: feed.id == selectedOption ? nil : 54)
                    .background(feed.id == selectedOption ? .DL : .gray.opacity(0.3), in: Capsule())
                    .clipped()
                    .animation(.bouncy, value: selectedOption)
                    .onTapGesture {
                        if selectedOption == feed.id {
                            selectedOption = nil
                        } else {
                            selectedOption = feed.id
                        }
                    }
                }
            }
        }
    }
}
