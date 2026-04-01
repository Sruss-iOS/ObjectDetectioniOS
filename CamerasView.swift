//
//  CamerasView.swift
//  iosApp
//
//  Created by Srushti Choudhari on 31/10/25.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI
import CoreMedia

//struct CamerasView: View {
//    @StateObject private var viewModel = CameraViewModel()
//
//    var body: some View {
//        ZStack {
//            CamerasPreview(session: viewModel.session)
//                .zIndex(0)
//
//            ForEach(viewModel.detections) { detection in
//                BoundingBoxView1(detection: detection)
//                    .zIndex(1)
//            }
//        }
//        .onAppear {
//            viewModel.startSession()
//        }
//        .onDisappear {
//            viewModel.stopSession()
//        }
//    }
//}

//struct CamerasView: View {
//    @StateObject private var viewModel = CameraViewModel()
//    @State private var showDetails: Bool = false  // Shared state
//
//    var body: some View {
//        ZStack {
//            CamerasPreview(session: viewModel.session)
//                .zIndex(0)
//
//            ForEach(viewModel.detections) { detection in
//                BoundingBoxView(detection: detection, showDetails: $showDetails)
//                    .zIndex(1)
//            }
//
//            VStack {
//                Spacer()
//                Button(action: {
//                    showDetails.toggle()
//                }) {
//                    Text(showDetails ? "Hide All Details" : "Show All Details")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                }
//                .padding()
//            }
//        }
//        .onAppear {
//            viewModel.startSession()
//        }
//        .onDisappear {
//            viewModel.stopSession()
//        }
//    }
//}



struct CamerasView: View {
    @StateObject private var viewModel = CameraViewModel()
    @State private var showDetails: Bool = false
    @State private var frozenDetection: DetectResult? = nil // NEW
    @State private var frozenLabel: String? = nil           // NEW

    var body: some View {
        ZStack {
            CamerasPreview(session: viewModel.session)
                .zIndex(0)

            if let detection = frozenDetection {
                // Show only the frozen bounding box
                BoundingBoxView(
                    detection: detection,
                    showDetails: $showDetails,
                    displayedLabel: frozenLabel ?? detection.label
                )
                .zIndex(1)
            }

            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        showDetails.toggle()
                    }) {
                        Text(showDetails ? "Hide Details" : "Show Details")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                    Spacer()

                    Button(action: {
                        // Reset freeze so next detection locks
                        frozenDetection = nil
                        frozenLabel = nil
                    }) {
                        Text("Detect Again")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.startSession()
        }
        .onDisappear {
            viewModel.stopSession()
        }
        .onChange(of: viewModel.detections) { detections in
            if frozenDetection == nil, let first = detections.first {
                frozenDetection = first
                frozenLabel = first.label
            }
        }
    }
}
