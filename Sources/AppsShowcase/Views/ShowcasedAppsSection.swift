import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ShowcasedAppsSection: View {
    @State private var apps: [ShowcasedApp] = []
    @Binding private var isLoading: Bool
    private let titleKey: LocalizedStringKey
    private let url: URL

    public init(_ titleKey: LocalizedStringKey, url: URL, isLoading: Binding<Bool> = .constant(false)) {
        self.titleKey = titleKey
        self.url = url
        self._isLoading = isLoading
    }

    public var body: some View {
        Section(apps.isEmpty ? "" : titleKey) {
            ForEach(apps) { app in
                ShowcasedAppLink(app: app)
            }
        }
        .task { await load() }
    }

    private func load() async {
        let showcase = AppsShowcase(url: url)
        isLoading = true
        switch await showcase.retrieve() {
        case let .success(apps):
            self.apps = apps
        case let .failure(error):
            print(error.localizedDescription)
        }
        isLoading = false
    }
}
