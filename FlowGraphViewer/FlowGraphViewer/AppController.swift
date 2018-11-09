//
//  AppController.swift
//

import Cocoa
import Chaining

class AppController {
    static let shared = AppController()
    
    let url = Holder<URL?>(nil)
    
    func open() {
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowsMultipleSelection = false
//        openPanel.allowedFileTypes = ["swift"]
        
        openPanel.begin { [weak openPanel, weak self] response in
            guard let openPanel = openPanel, let self = self else {
                return
            }
            
            switch response {
            case NSApplication.ModalResponse.OK:
                self.url.value = openPanel.url
            default:
                break
            }
        }
    }
}
