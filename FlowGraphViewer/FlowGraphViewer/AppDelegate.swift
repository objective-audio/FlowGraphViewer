//
//  AppDelegate.swift
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DispatchQueue.main.async {
            AppController.shared.open()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func open(_ sender: Any) {
        AppController.shared.open()
    }
}

