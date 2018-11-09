//
//  FileUtils.swift
//

import Foundation

func temporaryDirectoryURL() -> URL {
    return URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true, relativeTo: nil)
}
