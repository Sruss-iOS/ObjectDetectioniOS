# CornerShop iOS — Object Detection Feature

Overview

This repository contains the iOS app for CornerShop's mobile experience and includes an on-device object detection feature used to recognize retail products in the camera feed. The object detection pipeline uses a TensorFlow Lite model and custom SwiftUI views to show bounding boxes and product details.

This README briefly documents the object-detection feature, important files, how to build and run the app locally, and troubleshooting tips for common issues.

Key features

- On-device object detection (TensorFlow Lite)
- Bounding box overlay UI implemented in SwiftUI (`BoundingBoxView.swift`)
- Product lookup and enriched product details (Core Data usage observed in code)
- Inline product videos, images, and Add-to-Cart actions in the detected object card

Project layout (relevant paths)

- iosApp/iosApp/
  - View/TensorFlowOB/Views/BoundingBoxView.swift — SwiftUI view that renders detection bounding boxes and detailed product cards.
  - cornershopmodel.tflite — TensorFlow Lite model used for object detection (in the app bundle).
  - Info.plist — App configuration and privacy usage descriptions (camera permission required).
  - GoogleService-Info.plist — Firebase/Google configuration (present but not required for local object detection).
  - ViewModel/, Model/ — App-specific model & view model code (contains CoreDataManager references to product data).

Dependencies

- Xcode (recommended: Xcode 14 or newer)
- CocoaPods (used by project; Pods/ is present in the workspace)
- iOS deployment target: check the Xcode project settings (default is set in the project)
- Third-party frameworks included via CocoaPods: TensorFlowLite, MediaPipe (see `Pods/`)

Quick setup & build (local macOS + device/simulator)

1. Ensure prerequisites are installed:

```bash
# macOS prerequisites
# Install CocoaPods (if not already installed)
sudo gem install cocoapods

# Optional: ensure command line tools are up to date
xcode-select --install
```

2. From the iOS app root (this repository's `iosApp` folder), install pods if you need to refresh them:

```bash
cd "/Users/srushtichoudhari/Desktop/Retail X/CornerShopAppMobileAndroid/iosApp/"
pod install --repo-update
```

Note: this workspace already contains a `Pods/` directory and `Podfile.lock`. Running `pod install` is safe if you need to refresh or reproduce the environment.

3. Open the Xcode workspace, not the project file:

```bash
open iosApp.xcworkspace
```

4. Select a simulator or physical device and run the `iosApp` target.

Important runtime notes

- Camera permissions: The app uses the camera for live object detection. Ensure `NSCameraUsageDescription` (and any other required privacy keys) are present in `Info.plist` with a user-facing reason.
- Model location: The TFLite model `cornershopmodel.tflite` is bundled inside `iosApp/iosApp/`. If you update the model, confirm it's added to the app target's resources.
- Device performance: On-device detection is CPU/GPU intensive. Test on a physical device for realistic performance and battery usage.

How object detection is wired (developer notes)

- Model: `cornershopmodel.tflite` — used by the detection pipeline (TensorFlow Lite integration is present via Pods). Check the codebase for the class that loads this model and runs inference.
- UI: `BoundingBoxView.swift` renders a fixed-size bounding box overlay (400 x 700 by default) and displays a label and, optionally, an expandable details card. There are two variants in the file: `BoundingBoxView` (binding-based to toggle details) and `BoundingBoxView1` (self-contained).
- Product data: The project references `CoreDataManager.shared.getProductDetailsByName(...)` to fetch additional metadata, descriptions, and video URLs for detected labels.

Troubleshooting

- Build errors related to CocoaPods/frameworks
  - Run `pod install` and open the `.xcworkspace`. If you get architecture or missing header errors, clean the build folder (Product → Clean Build Folder) and rebuild.

- Model not found at runtime
  - Confirm `cornershopmodel.tflite` is included in the app target's resources and the filename matches exactly.

- Camera permission prompt not shown / camera feed blank
  - Ensure `NSCameraUsageDescription` exists in `Info.plist`. If the user previously denied camera access, re-enable it via the device Settings → App → Camera.

- Video playback in details panel
  - Detail cards sometimes include a video URL string stored in Core Data. Ensure the URL is valid, and the device has network connectivity. For on-device offline demos, embed a local video and update the data source.

Testing

- Unit tests are available in the `iosAppTests` target. Run them from Xcode (Product → Test) or via `xcodebuild`/`xctest` for CI.

Contributing

- Fork the repo and open a PR with clear description and small, focused commits.
- Keep UI and model changes separated when possible (e.g., model updates are separate PRs from UI behavior).

Assumptions & notes

- This README focuses on the object detection feature inside the iOS app. It assumes CocoaPods is the dependency manager and that the `iosApp` workspace contains the source and bundled model.
- If you want a sample dataset or a CI configuration, we can add scripts for running unit tests and static analysis.

Contact / Next steps

If you'd like, I can:
- Add an internal developer guide describing the detection pipeline (where the model is invoked and how detections are mapped to UI), or
- Add a small demo screen & README section showing how to toggle the details card and play embedded videos locally.

License

- This repo does not contain an explicit license file. Add a LICENSE file to clarify terms for contributors and consumers.
