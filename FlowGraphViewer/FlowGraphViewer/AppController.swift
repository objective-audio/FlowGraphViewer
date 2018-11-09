//
//  AppController.swift
//

import Cocoa
import Chaining

class AppController {
    static let shared = AppController()
    
    #warning("とりあえず画像のURLを持ってみる")
    
    func open() {
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowsMultipleSelection = false
//        openPanel.allowedFileTypes = ["swift"]
        
        openPanel.begin { response in
            switch response {
            case NSApplication.ModalResponse.OK:
                print("ok : \(response)")
            case NSApplication.ModalResponse.cancel:
                print("cancel : \(response)")
            default:
                break
            }
        }
    }
}
