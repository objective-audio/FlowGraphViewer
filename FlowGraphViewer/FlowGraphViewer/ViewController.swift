//
//  ViewController.swift
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = NSImage(named: NSImage.Name("omatsuri_hashigonori"))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

