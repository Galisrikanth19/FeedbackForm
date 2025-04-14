//
//  DashboardView.swift
//  Created by GaliSrikanth on 14/04/25.

import SwiftUI

struct DashboardView: View {
    enum FeedbackType {
        case type1, type2
    }
    
    @State private var selectedType: FeedbackType = .type1
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 100)
            
            feedbackTypeSelector
            
            Spacer()
            
            feedbackContent
            
            Spacer()
                .frame(height: 100)
        }
    }
    
    private var feedbackTypeSelector: some View {
        HStack(spacing: 30) {
            feedbackTypeButton(title: "Type1",
                               type: .type1)
            
            feedbackTypeButton(title: "Type2",
                               type: .type2)
        }
    }
    
    private func feedbackTypeButton(title: String, type: FeedbackType) -> some View {
        Button(action: {
            selectedType = type
        }) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    selectedType == type ? Color.blue.opacity(0.2) : Color.clear
                )
                .cornerRadius(10)
                .foregroundStyle(selectedType == type ? .blue : .primary)
        }
    }
    
    @ViewBuilder
    private var feedbackContent: some View {
        switch selectedType {
        case .type1:
            FeedbackView()
            
        case .type2:
            FeedbackTow()
        }
    }
}
