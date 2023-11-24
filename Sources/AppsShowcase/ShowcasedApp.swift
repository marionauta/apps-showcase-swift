import Foundation

public struct ShowcasedApp: Decodable, Equatable, Identifiable {
    public let id: String
    public let name: String
    public let tagline: String
    internal let ios: URL
    public var url: URL { ios }
}
