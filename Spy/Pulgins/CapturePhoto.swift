//
//  CapturePhotos.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import AVFoundation

class CapturePhoto: Plugin {
    required init() {}
    
    var name: String = "Capture Photo"
    weak var delegate: PluginDelegate?
    
    func execute() {
        do {
            let captureSession = AVCaptureSession()
            
            // Set up video input
            guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
                throw CapturePhotoError.videoDeviceNotFound
            }
            
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                throw CapturePhotoError.videoInputNotAdded
            }
            
            // Set up photo output
            let photoOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddOutput(photoOutput) {
                captureSession.addOutput(photoOutput)
            } else {
                throw CapturePhotoError.photoOutputNotAdded
            }
            
            // Start the capture session
            captureSession.startRunning()
            
        } catch {
            print("Error setting up capture session: \(error)")
        }
    }
}

enum CapturePhotoError: Error {
    case videoDeviceNotFound
    case videoInputNotAdded
    case photoOutputNotAdded
}
