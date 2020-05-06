import Foundation

FileManager.documentDirectoryURL.path

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
mysteryDataURL.lastPathComponent

let stringURL: URL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
stringURL

