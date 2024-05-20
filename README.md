 Overview
Hacker News is an iOS application developed using SwiftUI, designed to provide users with the latest and most popular tech stories from Hacker News. The app features custom fonts, a loading view using GIFs, and seamless web image loading. It utilizes various third-party libraries for enhanced functionality and performance and follows the MVVM (Model-View- ViewModel) architectural pattern.
Features
• Latest Stories: Fetches and displays the most recent stories from Hacker News.
• Top Stories: Displays the top trending stories.
• Custom Fonts: Implements custom fonts to enhance the user interface.
• Loader View: Uses GIF files for loading animations.
• Web Image Viewing: Uses SSDWebImageSwiftUI for loading images from URLs efficiently.
• API Integration: Uses Alamofire for network requests to the Hacker News API.
Technologies and Libraries Used
• SwiftUI: The main framework used for building the user interface.
• CocoaPods: Dependency manager used for integrating third-party libraries.
• Alamofire: Used for making API calls and handling network requests.
• SSDWebImageSwiftUI: Used for asynchronous image loading from URLs.
• Custom Fonts: Added to the app for a better visual appeal.
• GIF Loader: Integrated a loader view using a GIF file for better user experience during data fetching.
Project Structure
• App: The main application logic and SwiftUI views.
• Network: Contains API service classes and network-related logic.
• Resources: Includes custom fonts, images, and other resources.
• Utilities: Helper functions and extensions.
• Models: Data models representing the API responses.
• ViewModels: Manages the data and business logic to be displayed
by the Views.
• Views: SwiftUI Views that represent the UI of the app, binding to
ViewModels.

 MVVM Architecture
The app follows the MVVM (Model-View-ViewModel) architectural pattern:
• Model: Represents the data and business logic (e.g., data models,
API responses).
• View: The SwiftUI views that display the UI components.
• ViewModel: Binds the Model and View, handling the presentation
logic and state management.
Usage
• Launch the app to view the latest tech stories from Hacker News.
• Navigate between different story sections such as Latest and Top Stories.
• Tap on a story to view more details or read the full article.
• Enjoy a smooth and responsive user experience with custom animations and transitions.
