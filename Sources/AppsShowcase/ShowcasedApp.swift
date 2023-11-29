import Foundation

public struct ShowcasedApp: Decodable, Equatable, Identifiable {
    public let id: String
    public let name: String
    public let tagline: String
    internal let ios: URL
    internal let beta: Bool?
    public var url: URL { ios }
    public var isBeta: Bool { beta ?? false }
}
