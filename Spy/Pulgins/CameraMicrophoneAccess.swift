//
//  CameraMicrophoneAccess.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import AVFoundation

class CameraMicrophoneAccess: Plugin {
    required init() {}

    var name: String = "Camera Microphone Access"
    weak var delegate: PluginDelegate?

    func execute() throws {
        print("Capturing audio and video...")
        do {
            let captureSession = AVCaptureSession()
            
            // Set up video input
            guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
                throw CameraMicrophoneAccessError.videoDeviceNotFound
            }
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                throw CameraMicrophoneAccessError.videoInputNotAdded
            }
            
            // Set up audio input
            guard let audioDevice = AVCaptureDevice.default(for: .audio) else {
                throw CameraMicrophoneAccessError.audioDeviceNotFound
            }
            let audioInput = try AVCaptureDeviceInput(device: audioDevice)
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            } else {
                throw CameraMicrophoneAccessError.audioInputNotAdded
            }
            
            // Set up video output
            let videoOutput = AVCaptureMovieFileOutput()
            if captureSession.canAddOutput(videoOutput) {
                captureSession.addOutput(videoOutput)
            } else {
                throw CameraMicrophoneAccessError.videoOutputNotAdded
            }
            
            // Start the capture session
            captureSession.startRunning()
        } catch {
            print("Error setting up capture session: \(error)")
        }
        delegate?.pluginDidFinish(plugin: self)
    }
}

enum CameraMicrophoneAccessError: Error {
    case videoDeviceNotFound
    case videoInputNotAdded
    case audioDeviceNotFound
    case audioInputNotAdded
    case videoOutputNotAdded
}
