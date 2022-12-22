//
//  FileManager-DocumentsDirectory.swift
//  Acquaintly
//
//  Created by Mitch on 12/21/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
