//
//  RecordAudio.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import AVFoundation

class RecordAudio: Plugin {
    required init() {}
    
    var name: String = "Record Audio"
    weak var delegate: PluginDelegate?
    
    func execute() {
        do {
            let captureSession = AVCaptureSession()
            
            // Set up audio input
            guard let audioDevice = AVCaptureDevice.default(for: .audio) else {
                throw RecordAudioError.audioDeviceNotFound
            }
            
            let audioInput = try AVCaptureDeviceInput(device: audioDevice)
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            } else {
                throw RecordAudioError.audioInputNotAdded
            }
            
            // Set up audio output
            let audioOutput = AVCaptureAudioDataOutput()
            if captureSession.canAddOutput(audioOutput) {
                captureSession.addOutput(audioOutput)
            } else {
                throw RecordAudioError.audioOutputNotAdded
            }
            
            // Start the capture session
            captureSession.startRunning()
        } catch {
            print("Error setting up capture session: \(error)")
        }
    }
}

enum RecordAudioError: Error {
    case audioDeviceNotFound
    case audioInputNotAdded
    case audioOutputNotAdded
}
