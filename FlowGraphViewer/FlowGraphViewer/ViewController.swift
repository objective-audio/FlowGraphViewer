//
//  ViewController.swift
//

import Cocoa
import Chaining

class FlippedImageView: NSImageView {
    override var isFlipped: Bool {
        return true
    }
}

class ViewController: NSViewController {
    @IBOutlet var scrollView: NSScrollView!
    var imageView: FlippedImageView!
    
    var pool = ObserverPool()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView = FlippedImageView(frame: NSZeroRect)
        self.scrollView.documentView = self.imageView
        
        self.pool += AppController.shared.url.chain().do { [weak self] url in self?.updateImage(with: url) }.sync()
    }
    
    private func updateImage(with url: URL?) {
        if let url = url, let image = NSImage(contentsOf: url) {
            self.imageView.frame = NSMakeRect(0, 0, image.size.width, image.size.height)
        } else {
            self.imageView.frame = NSZeroRect
        }
    }
}

