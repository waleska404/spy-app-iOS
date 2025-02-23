//
//  PluginsListViewModel.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

protocol PluginsListViewModel {
    func stealClipboard()
    func fetchSystemInfo()
}

final class PluginsListViewModelImpl: PluginsListViewModel {
    private var clipboardStealer: ClipboardStealer
    private var systemInfoFetcher: SystemInfoFetcher
    
    init(
        clipboardStealer: ClipboardStealer = ClipboardStealer(),
        systemInfoFetcher: SystemInfoFetcher = SystemInfoFetcher()
    ){
        self.clipboardStealer = clipboardStealer
        self.systemInfoFetcher = systemInfoFetcher
    }
    
    func stealClipboard() {
        clipboardStealer.execute()
    }
    
    func fetchSystemInfo() {
        try? systemInfoFetcher.execute()
    }
}
