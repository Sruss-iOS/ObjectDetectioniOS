//
//  CameraViewModel.swift
//  iosApp
//
//  Created by Srushti Choudhari on 06/11/25.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import MediaPipeTasksVision

class CameraViewModel: NSObject, ObservableObject {
    @Published var detections: [DetectResult] = []

    let session = AVCaptureSession()
    private var objectDetectorService: ObjectDetectorService?
    private let videoOutput = AVCaptureVideoDataOutput()
    private let queue = DispatchQueue(label: "camera.frame.processing")
    
    override init() {
        super.init()
        setupCamera()
        setupObjectDetector()
    }

    private func setupCamera() {
        session.beginConfiguration()

        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else {
            print("Failed to set up camera input")
            return
        }

        session.addInput(input)

        if session.canAddOutput(videoOutput) {
            videoOutput.videoSettings = [
                kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
            ]
            videoOutput.setSampleBufferDelegate(self, queue: queue)
            videoOutput.alwaysDiscardsLateVideoFrames = true
            session.addOutput(videoOutput)
        }

        session.commitConfiguration()
    }


    private func setupObjectDetector() {
        objectDetectorService = ObjectDetectorService.liveStreamDetectorService(
            model: DefaultConstants.model,
            maxResults: DefaultConstants.maxResults,
            scoreThreshold: DefaultConstants.scoreThreshold,
            liveStreamDelegate: self,
            delegate: DefaultConstants.delegate
        )
    }

    
    func startSession() {
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.startRunning()
            }
        }


    func stopSession() {
        session.stopRunning()
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
extension CameraViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        let orientation = UIImage.Orientation.from(deviceOrientation: UIDevice.current.orientation)
        let timestamp = Int(Date().timeIntervalSince1970 * 1000)

        objectDetectorService?.detectAsync(
            sampleBuffer: sampleBuffer,
            orientation: orientation,
            timeStamps: timestamp
        )
    }
}

// MARK: - ObjectDetectorServiceLiveStreamDelegate
extension CameraViewModel: ObjectDetectorServiceLiveStreamDelegate {
    func objectDetectorService(_ objectDetectorService: ObjectDetectorService,
                               didFinishDetection result: ResultBundle?,
                               error: Error?) {
        guard let result = result,
              let objectDetectorResult = result.objectDetectorResults.first as? ObjectDetectorResult else {
            return
        }

        
        let newDetections: [DetectResult] = objectDetectorResult.detections.compactMap { detection in
            guard let category = detection.categories.first,
                  category.score >= 0.5 else { // 80% confidence
                return nil
            }
            return DetectResult(
                label: detection.categories.first?.categoryName ?? "Unknown",
                boundingBox: detection.boundingBox
            )
        }


        DispatchQueue.main.async {
            self.detections = newDetections
        }
    }
}

extension UIImage.Orientation {
    static func from(deviceOrientation: UIDeviceOrientation) -> UIImage.Orientation {
        switch deviceOrientation {
        case .portrait:
            return .up
        case .landscapeLeft:
            return .left
        case .landscapeRight:
            return .right
        case .portraitUpsideDown:
            return .down
        default:
            return .up
        }
    }
}
