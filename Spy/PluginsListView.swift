//
//  PuglinsListView.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import SwiftUI

struct PluginsListView: View {
    @State private var viewModel: PluginsListViewModel = PluginsListViewModelImpl()
    
    var body: some View {
        Text("PuglinsListView")
        List() {
            Button("Clipboard Stealer", action: {
                viewModel.stealClipboard()
            })
            Button("System Info Fetcher", action: {
                viewModel.fetchSystemInfo()
            })
            Button("Video Recorder", action: {
                viewModel.recordVideo()
            })
            Button("Photo Capturer", action: {
                viewModel.capturePhoto()
            })
            Button("Audio Recorder", action: {
                viewModel.recordAudio()
            })
            Button("Location Fetcher", action: {
                viewModel.fetchLocation()
            })
            Button("Contacts Fetcher", action: {
                viewModel.fetchContacts()
            })
        }
    }
}
