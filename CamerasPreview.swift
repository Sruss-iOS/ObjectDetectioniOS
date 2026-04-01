//
//  CameraPreview.swift
//  iosApp
//
//  Created by Srushti Choudhari on 05/11/25.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI
import AVFoundation

struct CamerasPreview: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // No update needed
    }
}
