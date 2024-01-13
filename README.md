# AppsShowcase

A tiny opinionated library for retrieving and displaying apps that you want to
showcase inside your app. Useful for cross promoting apps by the same developer.

## Install

Add `https://github.com/marionauta/apps-showcase-swift` to your Swift Package
Manager dependencies. Other dependency managers are not supported.

## How to use it

`AppsShowcase` requires a `.json` file hosted somewhere with the following schema:

```json
[
  {
    "id": "string", // An unique string, usually the bundle id.
    "name": "string",
    "tagline": "string",
    "ios": "string", // A valid url to the app.
    "beta": true // Optional. Marks the app as beta if true.
  }
]
```

Then in your code:

```swift
import AppsShowcase

func load() async {
    let showcase = AppsShowcase(url: URL(string: "https://example.com/apps.json")!)
    switch await showcase.retrieve() {
    case let .success(apps):
        print(apps)
    case let .failure(error):
        print(error.localizedDescription)
    }
}
```

By default `AppsShowcase` will omit apps with the same bundle id as the current
running one. This can be disabled by creating it as:

```swift
let showcase = AppsShowcase(url: URL(string: "...")!, excludingId: nil)
```

## Display the apps

You can display the `ShowcasedApp` object however you want. Two basic views
`ShowcasedAppRow` and `ShowcasedAppLink` are provided out of the box:

```swift
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct AppList: View {
    let apps: [ShowcasedApp]

    var body: some View {
        ForEach(apps) { app in
            Link(destination: app.url) {
                ShowcasedAppRow(app: app)
            }
        }
        ForEach(apps) { app in
            ShowcasedAppLink(app: app) // Uses `Link` for you
        }
    }
}
```

## Out of the box

An additional `ShowcasedAppsSection` view is provided, that takes care of
fetching and displaying the app list:

```swift
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct AppList: View {
    @State private var isLoading: Bool = false

    var body: some View {
        // Simple
        ShowcasedAppsSection("My other apps", url: URL(string: "...")!)
        // To report the loading status:
        ShowcasedAppsSection("My other apps", url: URL(string: "...")!, isLoading: $isLoading)
    }
}
```
