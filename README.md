# Alpha Diet

Alpha Diet is a comprehensive Flutter application designed to help you manage your nutrition and hydration needs effectively. The app offers personalized recommendations, insightful nutrition information, and goal-setting features to assist you in leading a healthier lifestyle.

## Features

- **Home Page**: Access the main sections of the app, including Food Nutritions, Hydration, Suggestions, and Goals.
- **About Page**: Learn more about the Alpha Diet app and its purpose.
- **Custom Form**: Fill out a form with your name, email, and password.
- **Goals Page**: Set and track your health and fitness goals.
- **Rating Page**: Rate the Alpha Diet app.
- **Nutrition Page**: Explore nutritional information for different food categories like Meat, Vegetables, Fruits, and Snacks.
- **Hydration Page**: Learn about various drinks and their benefits for hydration.
- **Suggestion Page**: Get tips on diet, exercise, wellness, and lifestyle.
- **Q&A Page**: Ask questions and get answers about nutrition and health.
- **Settings Page**: Customize your app experience, including dark mode and font size.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/alpha-diet.git
    cd alpha-diet
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

## File Structure

```
lib/
│
├── main.dart                # Entry point of the app
├── home_page.dart           # Home page of the app
├── about_page.dart          # About page
├── form_page.dart           # Custom form page
├── goals_page.dart          # Goals page
├── rating_page.dart         # Rating page
├── nutrition_page.dart      # Nutrition page
├── hydration_page.dart      # Hydration page
├── suggestion_page.dart     # Suggestion page
├── qanda_page.dart          # Q&A page
└── settings_page.dart       # Settings page
```

## Code Overview

### main.dart

The main entry point of the application. It sets up the routes for the different pages.

```dart
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'form_page.dart';
import 'goals_page.dart';
import 'rating_page.dart';
import 'nutrition_page.dart';
import 'hydration_page.dart';
import 'suggestion_page.dart';
import 'qanda_page.dart';
import 'settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Diet',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/form': (context) => MyCustomForm(),
        '/goals': (context) => GoalsPage(),
        '/rating': (context) => RatingPage(),
        '/food_nutritions': (context) => NutritionPage(),
        '/hydration': (context) => HydrationPage(),
        '/suggestion': (context) => SuggestionPage(),
        '/qanda': (context) => QandAPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
```

### home_page.dart

The main page of the app with navigation to different sections.

```dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
        title: Text('Alpha Diet'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 177, 160, 1),
              ),
              child: Text(
                'Sections',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Q&A'),
              onTap: () {
                Navigator.pushNamed(context, '/qanda');
              },
            ),
            ListTile(
              title: Text('Rate the App'),
              onTap: () {
                Navigator.pushNamed(context, '/rating');
              },
            ),
            ListTile(
              title: Text('Fill Form'),
              onTap: () {
                Navigator.pushNamed(context, '/form');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/diet1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildButton(context, '/food_nutritions', 'Food Nutritions', 200),
                SizedBox(height: 10),
                _buildButton(context, '/hydration', 'Hydration', 200),
                SizedBox(height: 10),
                _buildButton(context, '/suggestion', 'Suggestion', 200),
                SizedBox(height: 10),
                _buildButton(context, '/goals', 'Goals', 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String route, String text, double width) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(text, style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(243, 177, 160, 1),
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}
```

The rest of the pages follow a similar structure, providing various functionalities such as filling forms, viewing details, and setting goals.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework.
- All contributors and testers for their feedback and support.
  
For any inquiries or support, please contact us at: support@alphadiet.com
