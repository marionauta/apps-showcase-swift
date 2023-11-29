import SwiftUI

@available(iOS 15.0, *)
public struct ShowcasedAppRow: View {
    private let app: ShowcasedApp

    public init(app: ShowcasedApp) {
        self.app = app
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(app.name)
                    .font(.headline.weight(.regular))
                    .foregroundColor(.primary)
                if app.isBeta {
                    Text("apps_showcase_beta_label", bundle: .module)
                        .font(.caption)
                        .foregroundStyle(.tint)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(.tint.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .overlay(RoundedRectangle(cornerRadius: 2).stroke(.tint, lineWidth: 0.5))
                }
            }
            Text(app.tagline)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}
