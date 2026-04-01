// Copyright 2023 The MediaPipe Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import UIKit
import MediaPipeTasksVision

// MARK: Define default constants
struct DefaultConstants {
  static let maxResults = 1
  static let scoreThreshold: Float = 0.2
  static let labelColors = [
    UIColor.green,
  ]
  static let displayFont = UIFont.systemFont(ofSize: 14.0, weight: .medium)
  static let model: Model = .lorealvisit
  static let delegate: Delegate = .CPU
}

// MARK: Model
enum Model: Int, CaseIterable {
  case lorealvisit
  
  var name: String {
    switch self {
    case .lorealvisit:
      return "lorealvisit"
    }
  }
  
  var modelPath: String? {
      return Bundle.main.path(forResource: self.name, ofType: "tflite")
  }
  
  init?(name: String) {
      if name.lowercased().contains("lorealvisit") {
          self = .lorealvisit
      } else {
          return nil
      }
  }
  
}

