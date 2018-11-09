//
//  FileUtils.swift
//

import Cocoa

struct FileUtils {
    static func temporaryDirectoryURL() -> URL {
        return URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true, relativeTo: nil)
    }
    
    static func temporaryImageURL() -> URL {
        return self.temporaryDirectoryURL().appendingPathComponent("temp")
    }
    
    static func save(image: NSImage, to url: URL) {
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: self.temporaryImageURL().path) {
            try! fileManager.removeItem(at: self.temporaryImageURL())
        }
        
        guard let rep = image.tiffRepresentation else {
            fatalError()
        }
        
        try! rep.write(to: self.temporaryImageURL())
    }
}

