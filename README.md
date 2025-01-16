# Zybo Intern App

Zybo Intern App is a Flutter-based mobile application designed for managing a wishlist. Users can view, add, and remove products from their wishlist, which is stored in a local SQLite database.

## Features

- View a list of favourite products.
- Add and remove products from the wishlist.
- Persistent storage using SQLite database to save the favourites.
- Custom UI with a grid layout for displaying products.
- Use of the `Provider` package for state management.

## Prerequisites

Before running this app, ensure that you have the following installed:

- Flutter (https://flutter.dev/docs/get-started/install)
- Dart SDK (usually comes with Flutter)
- SQLite (for local database)

## Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/your-username/zybo_intern_app.git
cd zybo_intern_app

The project follows a clean architecture with the following folder structure:
lib/
│
├── controller/           # Contains the logic for handling business data (e.g., FavouriteScreenController)
│
├── models/               # Model classes for the data
│
├── screens/              # UI components for the different screens (e.g., FavouriteScreen)
│
├── utils/                # Utility classes and constants (e.g., ColorConstants)
│
└── main.dart             # Entry point for the application

