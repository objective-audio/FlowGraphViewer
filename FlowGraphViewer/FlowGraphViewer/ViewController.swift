//
//  ViewController.swift
//

import Cocoa

class FlippedImageView: NSImageView {
    override var isFlipped: Bool {
        return true
    }
}

class ViewController: NSViewController {
    @IBOutlet var scrollView: NSScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = NSImage(named: NSImage.Name("omatsuri_hashigonori")) {
            self.updateImage(image)
        }
    }

    func updateImage(_ image: NSImage) {
        let imageView = FlippedImageView(image: image)
        imageView.frame = NSMakeRect(0, 0, image.size.width, image.size.height)
        self.scrollView.documentView = imageView
    }
}

