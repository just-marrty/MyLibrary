# MyLibrary

A SwiftUI application demonstrating a library management system with search, sorting, and navigation functionality using modern Swift state management.

## Features

- Browse a collection of books and authors from JSON data
- Real-time search functionality to filter by author name
- Toggle between alphabetical and ID-based sorting
- Detailed author view with book information and descriptions
- Smooth animated transitions with symbol effects
- Dark mode optimized interface

## Architecture

The project demonstrates clean architecture with modular organization.

**Components**:

- **Model**: `MyLibrary` - Decodable struct representing book/author data with Identifiable conformance
- **Service**: `Library` - Data manager class handling JSON decoding, search, and sorting operations
- **Views**:
  - `ContentView` - Main container view with searchable list and toolbar
  - `AuthorView` - Detail view displaying author information, title, and description
- **App**: `MyLibraryApp` - SwiftUI app entry point

**State Management**: 
- Uses `@State` for local view state (search text, sorting preference)
- Computed properties for filtered and sorted data
- Reactive UI updates with SwiftUI's declarative syntax
- No ViewModel pattern - business logic handled in `Library` service class

## Technologies

- **SwiftUI**: Modern declarative UI framework
- **Foundation**: JSON decoding with `JSONDecoder` and snake_case conversion
- **NavigationStack**: Modern navigation pattern for iOS
- **Searchable**: Built-in search functionality with autocorrection disabled
- **Toolbar**: Custom toolbar items with animated symbol effects
- **Animation**: Smooth transitions with `withAnimation` and `symbolEffect`

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+
