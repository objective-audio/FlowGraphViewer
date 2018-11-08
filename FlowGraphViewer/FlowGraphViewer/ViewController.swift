//
//  ViewController.swift
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var scrollView: NSScrollView!
//    @IBOutlet var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = NSImage(named: NSImage.Name("omatsuri_hashigonori")) {
            let imageView = NSImageView(image: image)
            imageView.frame = NSMakeRect(0, 0, image.size.width, image.size.height)
            self.scrollView.documentView = imageView
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

