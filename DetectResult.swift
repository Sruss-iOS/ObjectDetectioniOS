//
//  DetectResult.swift
//  iosApp
//
//  Created by Srushti Choudhari on 04/11/25.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation

struct DetectResult: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let boundingBox: CGRect
}
