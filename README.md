# zylentirx_flutter_assignment

## Overview

This Flutter application demonstrates a complete implementation for fetching and displaying data from a public API using a clean, layered architecture. The app fetches posts from [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts) and utilizes Bloc for state management, connectivity checks, and comprehensive error handling. The UI is enhanced with attractive Card widgets and custom fonts (Josefin Sans and Roboto) provided by the `google_fonts` package.

## Features

- **API Integration:**  
    Uses the `http` package to fetch posts from a public API.
- **Bloc State Management:**  
    Manages loading, loaded, and error states to separate business logic from the UI.
- **Connectivity Check:**  
    Detects network availability using `connectivity_plus` to handle offline scenarios.
- **Comprehensive Error Handling:**  
    Catches HTTP errors, timeouts, socket errors, and format exceptions, passing descriptive messages to the UI.
- **Enhanced UI:**  
    Displays posts in styled Card widgets with custom fonts (Josefin Sans for headings and Roboto for body text) for a modern look.
- **Retry Mechanism:**  
    Provides a user-friendly Retry button when an error occurs.

## Project Structure

flutter_api_fetch_app/
├── lib/
│   ├── main.dart ## Entry point of the application
│   ├── models/
│   │   └── post.dart ## Model for parsing post data
│   ├── screens/
│   │   └── home_screen.dart ## UI screen to display posts
│   ├── services/
│   │   └── api_service.dart ## Handles API requests and error handling
│   └── bloc/
│       ├── post_bloc.dart  ## Bloc implementation for post
│       ├── post_event.dart ## Bloc events
│       └── post_state.dart ## Bloc states
├── pubspec.yaml ## Dependency management
└── README.md ## This file

## Installation

Instructions on how to install and set up the project

```bash
# Clone the Repository
git clone https://github.com/Israel02-tech/Zylentrix_flutter_assignment.git

# Navigate to the project directory
cd Zylentrix_flutter_assignment

# Install Dependencies
flutter pub get

# Run the App
flutter run
```

## Dependencies

- http: For making API requests.
- flutter_bloc: For state management using Bloc.
- equatable: For value equality in Bloc events and states.
- connectivity_plus: For checking network connectivity.
- google_fonts: For integrating custom fonts.

## Assumptions & Enhancements

- The API is expected to return a valid list of posts under normal conditions.
- Connectivity checks when the user device is offline, in order to enhance the user experience.
- Comprehensive error handling to manage various exceptions such as HTTP errors, timeouts, and data format issues.
- The UI is designed to be modern and engaging using Card widgets and custom fonts.
- Future enhancements could include pull-to-refresh, pagination, or more detailed post views.

## License

- Feel free to adjust any sections to better suit your project's specific requirements or style preferences.
