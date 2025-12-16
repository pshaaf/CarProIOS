# CarProiOS

A native SwiftUI iOS app for a vehicle marketplace, inspired by apps like Carvana.

## Features

- **Explore Screen**: Browse vehicles with a personalized greeting, search functionality, and recently viewed items
- **Vehicle Detail Screen**: Comprehensive vehicle information including:
  - Hero image with interactive hotspots
  - Tab navigation (Exterior/Interior/Key Features)
  - "Great Deal" pricing badge with KBB comparison
  - Feature highlight cards
  - FAQ section
  - Pickup/Delivery options
  - Purchase flow integration
- **Favorites**: Save your favorite vehicles (placeholder)
- **Sell/Trade**: Sell or trade-in your vehicle (placeholder)
- **Finance**: Explore financing options (placeholder)
- **Account**: User profile management (placeholder)

## Requirements

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

## Project Structure

```
CarProiOS/
├── CarProiOS.xcodeproj
├── CarProiOS/
│   ├── CarProiOSApp.swift          # App entry point
│   ├── ContentView.swift            # Main TabView container
│   ├── Models/
│   │   └── Vehicle.swift            # Vehicle data model
│   ├── Views/
│   │   ├── ExploreView.swift        # Main explore/home screen
│   │   ├── VehicleDetailView.swift  # Full vehicle detail screen
│   │   ├── FavoritesView.swift      # Favorites screen
│   │   ├── SellTradeView.swift      # Sell/Trade screen
│   │   ├── FinanceView.swift        # Finance screen
│   │   └── AccountView.swift        # Account screen
│   ├── Components/
│   │   ├── VehicleCard.swift        # Reusable vehicle card
│   │   ├── SearchBarView.swift      # Custom search bar
│   │   ├── GradientHeader.swift     # Blue gradient header
│   │   └── ChatButton.swift         # Floating chat FAB
│   ├── Theme/
│   │   └── Theme.swift              # Colors, typography, spacing
│   ├── Resources/
│   │   └── MockData.swift           # Mock vehicle data
│   └── Assets.xcassets/             # App icons and images
└── README.md
```

## Design System

### Colors
- Blue Gradient: `#4A90E2` → `#5BA3F5`
- Turquoise Accent: `#17A2B8`
- Price Green: `#2C7A3B`
- Badge Red: `#D32F2F`

### Typography
- Uses SF Pro (system font) with defined type scale
- Greeting: 24px Bold
- Section Headers: 16px Bold
- Body: 15px Regular

## Getting Started

1. Clone the repository
2. Open `CarProiOS.xcodeproj` in Xcode
3. Select a simulator or device
4. Build and run (⌘R)

## Screenshots

The app replicates the design of a modern vehicle marketplace with:
- Gradient headers
- Card-based vehicle listings
- Detailed vehicle pages with image galleries
- Floating chat button

## Architecture

- **SwiftUI**: Declarative UI framework
- **MVVM-lite**: Views with embedded state management
- **Navigation**: NavigationStack with type-safe routing

## License

This project is for educational/demonstration purposes.

