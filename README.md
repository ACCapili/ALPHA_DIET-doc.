# ALPHA_DIET-doc.

## Table of Contents:
-Project Overview
-Installation
-Usage
-Features
-Architecture
-Widgets and Components
-Navigation
-State Management
-API Integration
-Theming and Styling
-Animations
-Responsive Design
-Contributing
-License
-Further Reading

#Project Overview
Alpha Diet is a comprehensive diet and nutrition management mobile application built using Flutter. The app allows users to track their dietary intake, plan meals, and monitor their nutritional goals. It features a user-friendly interface with various widgets, navigation patterns, UI components, gestures, forms, themes, animations, and responsive design principles to ensure an engaging user experience.

Installation
Prerequisites
Flutter SDK: Install Flutter
Dart SDK: Comes bundled with Flutter
Android Studio or Visual Studio Code: Recommended IDEs
Steps
Clone the Repository


git clone https://github.com/ACCapilisername/alpha-diet-flutter.git
cd alpha-diet-flutter
Install Dependencies

flutter pub get
Run the Application


flutter run
Usage
Create an Account

Open the app.
Navigate to the registration screen.
Fill in the required information and submit to create a new account.
Log In

Navigate to the login screen.
Enter your credentials and log in.
Track Your Diet

Use the dashboard to add meals.
Search for food items from the database.
Log consumed food items to track your intake.
Plan Meals

Access the meal planning feature.
Create meal plans for different days.
Customize your meal plans according to your dietary goals.
Monitor Progress

Use the analytics feature to monitor your nutritional intake.
View charts and reports to understand your dietary habits.
Features
User Authentication: Secure registration and login functionality.
Food Database: A comprehensive database of food items with nutritional information.
Diet Tracking: Log daily meals and track nutritional intake.
Meal Planning: Create and manage meal plans.
Analytics: Visualize dietary data and monitor progress.
Personalized Recommendations: Get personalized diet recommendations based on your goals.
Architecture
The application follows the MVVM (Model-View-ViewModel) architecture to ensure a clean separation of concerns and maintainability.

Model: Contains data classes and business logic.
View: Represents the UI of the application.
ViewModel: Handles the logic and state management.
Widgets and Components
The application uses a variety of Flutter widgets and custom components, including but not limited to:

Scaffold: Basic material design layout structure.
AppBar: Top navigation bar.
BottomNavigationBar: Bottom navigation for main sections.
Form: Handles user input and validation.
ListView: Displays lists of items.
Drawer: Side navigation menu.
Card: Displays information in a card format.
Chart: Visualizes data in graphical form.
Navigation
The application employs various navigation patterns:

Named Routes: For defining and managing routes.
Navigator: For navigating between screens.
BottomNavigationBar: For tab-based navigation.
Drawer: For side navigation.
State Management
The application uses the Provider package for state management to ensure efficient and scalable state handling.

dependencies:
  provider: ^5.0.0
API Integration
The application integrates with a backend API to fetch and submit data.

Example API Request

Future<List<FoodItem>> fetchFoodItems() async {
  final response = await http.get(Uri.parse('https://api.example.com/foods'));

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List).map((i) => FoodItem.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load food items');
  }
}
Theming and Styling
The application supports light and dark themes, using the ThemeData class to define the color scheme and styling.


ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);
Animations
The application incorporates various animations for a smoother user experience:

Hero Animations: For seamless transitions between screens.
AnimatedContainer: For smooth resizing and property changes.
FadeTransition: For fading elements in and out.
Responsive Design
The application is designed to be responsive and adapt to different screen sizes and orientations using the MediaQuery class and LayoutBuilder widget.


@override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;

  return Scaffold(
    body: screenSize.width > 600
        ? _buildWideLayout()
        : _buildNarrowLayout(),
  );
}
Contributing
We welcome contributions from the community! To contribute:

Fork the repository.
Create a new branch for your feature or bugfix.
Implement your changes.
Submit a pull request with a detailed description of your changes.
License
This project is licensed under the MIT License. See the LICENSE file for more details.

Further Reading
Flutter Documentation
Dart Documentation
Provider Package
Adding a Code of Conduct to Your Project
Setting Up Your Project for Healthy Contributions






