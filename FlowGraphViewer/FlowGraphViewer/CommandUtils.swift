//
//  CommandUtils.swift
//

import Foundation

struct CommandUtils {
    @discardableResult
    static func execute(command: String) -> String {
        let process = Process()
        let pipe = Pipe()
        
        process.standardOutput = pipe
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", command]
        
        process.launch()
        
        let handle = pipe.fileHandleForReading
        let data = handle.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }
}
