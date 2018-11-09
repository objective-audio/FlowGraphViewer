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
        
        self.pool += AppController.shared.image.chain().do { [weak self] image in
            self?.updateImage(image)
        }.sync()
    }
    
    private func updateImage(url: URL?) {
        if let url = url, let image = NSImage(contentsOf: url) {
            self.updateImage(image)
        } else {
            self.updateImage(nil)
        }
    }
    
    private func updateImage(_ image: NSImage?) {
        self.imageView.image = image
        
        if let image = image {
            self.imageView.frame = NSMakeRect(0, 0, image.size.width, image.size.height)
        } else {
            self.imageView.frame = NSZeroRect
        }
    }
}

