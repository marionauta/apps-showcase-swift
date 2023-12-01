import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ShowcasedAppLink: View {
    private let app: ShowcasedApp

    public init(app: ShowcasedApp) {
        self.app = app
    }

    public var body: some View {
        Link(destination: app.url) {
            ShowcasedAppRow(app: app)
        }
    }
}
