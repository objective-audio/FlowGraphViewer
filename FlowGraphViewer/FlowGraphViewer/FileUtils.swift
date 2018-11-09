//
//  FileUtils.swift
//

import Cocoa

struct FileUtils {
    static func temporaryDirectoryURL() -> URL {
        return URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true, relativeTo: nil)
    }
    
    static func temporaryDotURL() -> URL {
        return self.temporaryDirectoryURL().appendingPathComponent("dot")
    }
    
    static func temporaryImageURL() -> URL {
        return self.temporaryDirectoryURL().appendingPathComponent("image")
    }
    
    static func removeFile(at url: URL) {
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: url.path) {
            try! fileManager.removeItem(at: url)
        }
    }
    
    static func dotFileExists() -> Bool {
        return FileManager.default.fileExists(atPath: self.temporaryDotURL().path)
    }
    
    static func imageFileExists() -> Bool {
        return FileManager.default.fileExists(atPath: self.temporaryImageURL().path)
    }
    
    static func removeTemporaryFiles() {
        self.removeFile(at: self.temporaryDotURL())
        self.removeFile(at: self.temporaryImageURL())
    }
    
    static func convertDotToImage() -> NSImage? {
        if !self.dotFileExists() {
            return nil
        }
        
        CommandUtils.execute(command: "dot -T png \(self.temporaryDotURL().path) -o \(self.temporaryImageURL().path)")
        
        if !self.imageFileExists() {
            return nil
        }
        
        return NSImage(contentsOf: self.temporaryImageURL())
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

