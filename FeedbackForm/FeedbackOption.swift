//
//  FeedbackOption.swift
//  Created by GaliSrikanth on 14/04/25.

import SwiftUI

struct FeedbackOption: Identifiable {
    let id = UUID()
    let icon: String
    var isSelected: Bool = false
    var color: Color = .clear
}
