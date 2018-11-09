//
//  AppDelegate.swift
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let image = NSImage(named: NSImage.Name("omatsuri_hashigonori")) else {
            fatalError()
        }
        
        FileUtils.save(image: image, to: FileUtils.temporaryImageURL())
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

