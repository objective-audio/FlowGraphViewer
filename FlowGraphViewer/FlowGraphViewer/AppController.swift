//
//  AppController.swift
//

import Cocoa
import Chaining

class AppController {
    static let shared = AppController()
    
    let url = Holder<URL?>(nil)
    let image = Holder<NSImage?>(nil)
    
    var pool = ObserverPool()
    
    init() {
        self.pool += self.url.chain().to { url in
            var image: NSImage? = nil
            if let url = url {
                image = NSImage(contentsOf: url)
            }
#warning("todo swiftを遷移図にする")
            return image
        }.receive(self.image).sync()
    }
    
    func open() {
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowsMultipleSelection = false
//        openPanel.allowedFileTypes = ["swift"]
        
        openPanel.begin { [weak openPanel, weak self] response in
            guard let self = self, let openPanel = openPanel else {
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
