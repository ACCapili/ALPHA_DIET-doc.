import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Home Page
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
          // Adding a semi-transparent overlay for better readability
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
          foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(243, 177, 160, 1), // Text color
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}

// About Page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About Alpha Diet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Alpha Diet is designed to help you manage your nutrition and hydration needs effectively. Our app offers personalized recommendations, insightful nutrition information, and goal-setting features to assist you in leading a healthier lifestyle.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Developed by a team of health and nutrition experts, Alpha Diet combines advanced algorithms with user-friendly interfaces to ensure you get the most accurate and helpful advice.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'For any inquiries or support, please contact us at: support@alphadiet.com',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

// MyCustomForm
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form successfully submitted')),
      );
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: RequiredValidator(errorText: "Name is required"),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Email is required"),
                  EmailValidator(errorText: "Enter a valid email address"),
                ]),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: MinLengthValidator(6, errorText: "Password must be at least 6 digits long"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Goals Page
class GoalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> goalsTopics = [
    {
      'title': 'Balance Diet',
      'description': 'Tips for maintaining a balanced diet.',
      'subtopics': [
        {
          'title': 'Eat Hydrating Foods',
          'description': 'Hydration doesn’t just come from drinking water. Choose foods with a high water content, such as:\n\n- Apples\n- Celery\n- Cucumber\n- Lettuce\n- Low-sodium broth\n- Peaches\n- Watermelon\n- Zucchini\n\nThese foods also offer plenty of vitamins and minerals.',
        },
        {
          'title': 'Get the Right Amount of Fiber',
          'description': 'Fiber is essential, but too much or the wrong kind can cause digestive issues. Opt for fiber-rich foods that are easier to digest, such as:\n\n- Bananas\n- Kiwi\n- Oats\n- Quinoa\n- Rice\n- Spinach\n- Sweet potatoes',
        },
      ],
    },
    {
      'title': 'Muscle Gain',
      'description': 'Strategies to build muscle effectively.',
      'subtopics': [
        {
          'title': 'Building Muscle Mass Requires SMART Goals',
          'description': 'Set Specific, Measurable, Achievable, Relevant, and Time-bound goals. Aim for a reasonable gain of 1-2 pounds of muscle per month. Adjust your goals based on progress and other commitments.',
        },
        {
          'title': 'Modify Workout Plan',
          'description': 'To overcome fitness plateaus, make small adjustments to your workout plan. Consistent changes can lead to visible progress towards your muscle gain goals.',
        },
      ],
    },
    {
      'title': 'Weight Loss',
      'description': 'Effective strategies for losing weight.',
      'subtopics': [
        {
          'title': 'Find Your Inner Drive',
          'description': 'Create a list of personal reasons for weight loss to stay motivated. Use visual reminders, such as notes on the refrigerator, to keep your goals in focus.',
        },
        {
          'title': 'Set Goals You Can Reach',
          'description': 'Aim to lose 1 to 2 pounds per week by burning 500 to 750 calories more than you consume daily. Start with a goal of losing 5% of your current weight to reduce health risks like heart disease and type 2 diabetes.',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: goalsTopics.length,
        itemBuilder: (context, index) {
          return _buildListItem(context, goalsTopics[index]);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> topic) {
    return ListTile(
      title: Text(topic['title']),
      subtitle: Text(topic['description']),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoalsDetailPage(title: topic['title'], subtopics: topic['subtopics']),
          ),
        );
      },
    );
  }
}

class GoalsDetailPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> subtopics;

  GoalsDetailPage({required this.title, required this.subtopics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: subtopics.length,
        itemBuilder: (context, index) {
          return _buildSubtopicItem(context, subtopics[index]);
        },
      ),
    );
  }

  Widget _buildSubtopicItem(BuildContext context, Map<String, dynamic> subtopic) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(subtopic['title']),
        subtitle: Text(subtopic['description']),
      ),
    );
  }
}


  Widget _buildCategoryButton(BuildContext context, String goal) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoalDetailPage(goal: goal),
          ),
        );
      },
      child: Text(goal),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Color.fromRGBO(243, 177, 160, 1),
        minimumSize: Size(80, 50),
      ),
    );
  }

class GoalDetailPage extends StatelessWidget {
  final String goal;

  GoalDetailPage({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(goal),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: Center(
        child: Text(
          'Details about $goal go here.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Rating Page
class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate the App'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Please rate our app:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              itemCount: 5,
              itemSize: 40,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating submission
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You rated the app $rating stars')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Nutrition Page
class NutritionPage extends StatelessWidget {
  final List<Map<String, dynamic>> nutritionTopics = [
    {
      'title': 'Meat',
      'description': 'Explore different types of meat and their nutritional benefits.',
      'subtopics': [
        {
          'title': 'Pork',
          'description': 'Pork is one of the most popular forms of meat in the world. Despite some confusion on the issue, pork is classed as red meat rather than white. This is because it contains a large amount of myoglobin, a protein responsible for the red color of meat.\n\nIn fact, there are so many different cuts of pork, and a variety of meat products use it such as;\n\n- Bacon\n- Ham\n- Hot dogs\n- Jamon\n- Prosciutto\n- Salami\n- Sausages\n\nNutrition Facts\nBased on data provided by the USDA FoodCentral Database, here is the typical nutritional profile for ground pork meat per 100g.',
        },
        {
          'title': 'Beef',
          'description': 'When most people think of red meat, they probably imagine beef.\n\nThere are many different beef products and cuts of beef, ranging from hamburgers to ribeye steaks.\n\nNutrition Facts\nHere are the nutrient values for ground beef per 100 grams.',
        },
      ],
    },
    {
      'title': 'Fruits',
      'description': 'Discover various fruits and their nutritional information.',
      'subtopics': [
        {
          'title': 'Apple',
          'description': 'Apples are a sweet fleshy fruit that grow around the world.\n\nBelieved to originate in Central Asia, there are now hundreds of varieties of apples, ranging from sweet to sour.\n\nPer large apple, the nutrient profile looks like this:\n\nCalories: 104 kcal\nCarbohydrate: 27.6 g\nFiber: 2.8 g\nSugar: 21.8 g\nFat: 0.3 g\nProtein: 0.6 g\nVitamin C: 14% RDA\nPotassium: 6% RDA\nManganese: 4% RDA\nVitamin B6: 4% RDA\nVitamin B2: 4% RDA\n\nApples come in all shapes and sizes, from Granny Smith to Pink Lady and more.',
        },
        {
          'title': 'Apricot',
          'description': 'Sharing some resemblances to a peach, apricots are a small fleshy fruit that contain a hard stone (technically a seed) in the middle.\n\nThe apricot is a popular fruit with a light orange color and it is best known for its vitamin A and C content.\n\nHere are the nutritional values per apricot:\n\nCalories: 16.8 kcal\nCarbohydrate: 3.9 g\nFiber: 0.7 g\nSugar: 3.2 g\nFat: 0.1 g\nProtein: 0.5 g\nVitamin A: 13% RDA\nVitamin C: 6% RDA\nPotassium: 3% RDA\nVitamin E: 2% RDA\nPhosphorus: 1% RDA',
        },
      ],
    },
    {
      'title': 'Vegetables',
      'description': 'Learn about various vegetables and their nutritional benefits.',
      'subtopics': [
        {
          'title': 'Cucumber',
          'description': 'Cucumbers are a refreshing and hydrating vegetable that is perfect for adding crunch to salads or as a refreshing snack. They are low in calories and high in nutrients, making them an excellent choice for anyone trying to maintain a healthy weight. Cucumbers are rich in antioxidants and contain several vitamins and minerals, including vitamin C, potassium, and magnesium.\n\nEating raw cucumbers can help improve your skin health, promote hydration, and improve your digestion. They are also known to have anti-inflammatory properties and may help reduce the risk of certain types of cancer.',
        },
        {
          'title': 'Carrots',
          'description': 'Carrots are a popular vegetable to eat raw due to their sweet, crunchy texture and high nutrient content. They are an excellent source of beta-carotene, a powerful antioxidant that converts into vitamin A in the body. Eating raw carrots can help improve your vision, boost your immune system, and promote healthy skin.\n\nCarrots are also low in calories and high in fiber, making them an excellent choice for anyone looking to lose weight or improve their digestive health. You can enjoy raw carrots as a snack, in salads, or even grated and used as a topping for sandwiches or wraps.',
        },
      ],
    },
    {
      'title': 'Snacks',
      'description': 'Find out about healthy snack options and their nutritional benefits.',
      'subtopics': [
        {
          'title': 'Apple or Pear with Nuts or Nut Butter',
          'description': 'This powerful combo is a popular go-to snack for several dietitians we interviewed—and for good reason. "Apples and pears contain fiber, especially if you eat the skin, and nuts are packed with a mix of plant-based protein, healthful fats and fiber, so they do a great job of satisfying your appetite while managing blood sugar," says Stark.',
        },
        {
          'title': 'Popcorn',
          'description': 'Craving something crunchy? "This high-fiber whole grain is the ultimate snack," says Kelsey Pezzuti, M.S., RD. "It\'s inexpensive, easy to prepare, and packs the perfect crunch."',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Nutritions'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: nutritionTopics.length,
        itemBuilder: (context, index) {
          return _buildListItem(context, nutritionTopics[index]);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> topic) {
    return ListTile(
      title: Text(topic['title']),
      subtitle: Text(topic['description']),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NutritionDetailPage(title: topic['title'], subtopics: topic['subtopics']),
          ),
        );
      },
    );
  }
}

class NutritionDetailPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> subtopics;

  NutritionDetailPage({required this.title, required this.subtopics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: subtopics.length,
        itemBuilder: (context, index) {
          return _buildSubtopicItem(context, subtopics[index]);
        },
      ),
    );
  }

  Widget _buildSubtopicItem(BuildContext context, Map<String, dynamic> subtopic) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(subtopic['title']),
        subtitle: Text(subtopic['description']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubtopicDetailPage(
                title: subtopic['title'],
                description: subtopic['description'],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SubtopicDetailPage extends StatelessWidget {
  final String title;
  final String description;

  SubtopicDetailPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


// Hydration Page
class HydrationPage extends StatelessWidget {
  final List<Map<String, dynamic>> hydrationTips = [
    {
      'title': 'Water',
      'description': 'Protects Your Tissues, Spinal Cord, and Joints\n\nWater does more than just quench your thirst and regulate your body’s temperature; it keeps the tissues in your body moist. Keeping your body hydrated helps it retain optimum levels of moisture in sensitive areas like the eyes, nose, mouth, blood, bones, and brain. Additionally, water protects your spinal cord and acts as a lubricant and cushion for your joints.',
    },
    {
      'title': 'Juice',
      'description': 'Juices contain various antioxidants that help reduce the risk of certain health issues and vitamins that support the body’s functions. Some fruit juices can help combat problems like constipation, and cranberry juice can help prevent UTIs. By drinking juice, your body can absorb nutrients quickly, and you can get a larger intake of vitamins and minerals, which may be lacking in your regular diet.',
    },
    {
      'title': 'Tea',
      'description': 'Traditional teas made from Camellia sinensis leaves have antioxidants and caffeine. They help in preventing cancer, reducing cholesterol levels, aiding weight loss, stimulating the mind and body, and reducing stress and anxiety. Different teas like green tea, black tea, oolong tea, and pu-erh tea are produced by varying the oxidation time of the leaves.',
    },
    {
      'title': 'Coffee',
      'description': 'Coffee boosts your energy and may lower your risk of type 2 diabetes and depression, support weight management, and help you live longer. It contains nutrients like riboflavin (vitamin B2), niacin (vitamin B3), magnesium, potassium, and antioxidants. Limiting caffeine intake is advised if you’re pregnant or nursing.',
    },
    {
      'title': 'Drinks',
      'description': 'While soda can be hydrating, it should not be relied upon for daily hydration. It’s best used occasionally, such as after heavy exercise. With a range of low-calorie and no-added-sugar options available, soft drinks can be part of a balanced diet. Kantar Worldpanel data shows a reduction in sugar content in soft drinks, and in 2023, 71% of soft drinks purchased in the UK were low/no calorie.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydration Tips'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: hydrationTips.length,
        itemBuilder: (context, index) {
          return _buildListItem(context, hydrationTips[index]);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> tip) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(tip['title']),
        subtitle: Text(tip['description']),
      ),
    );
  }
}



// Suggestion Page
class SuggestionPage extends StatelessWidget {
  final List<Map<String, dynamic>> tipsTopics = [
    {
      'title': 'Diet Tips',
      'description': 'Explore tips to help you maintain a healthy diet.',
      'subtopics': [
        {
          'title': 'Eat from Smaller Plates',
          'description': 'The size of your dinnerware can affect how much you eat. Eating from a large plate can make your portion look smaller, while eating from a small plate can make it look bigger. By eating from smaller dinnerware, you can trick your brain into thinking you’re eating more, making yourself less likely to overeat.',
        },
        {
          'title': 'Eat Your Greens First',
          'description': 'A good way to ensure you eat your greens is to enjoy them as a starter. This may lead you to eat fewer calories overall, which could result in weight loss. Plus, eating vegetables before a carb-rich meal has been shown to benefit blood sugar levels.',
        },
      ],
    },
    {
      'title': 'Exercise Tips',
      'description': 'Find out effective exercises to include in your routine.',
      'subtopics': [
        {
          'title': 'Lunges',
          'description': 'Challenging your balance is an essential part of a well-rounded exercise routine. Lunges promote functional movement while increasing strength in your legs and glutes. Complete 3 sets of 10 reps.',
        },
        {
          'title': 'Pushups',
          'description': 'Pushups are a basic yet effective bodyweight move that recruits multiple muscles. Complete 3 sets of as many reps as possible.',
        },
      ],
    },
    {
      'title': 'Wellness Tips',
      'description': 'Discover tips for overall wellness and health.',
      'subtopics': [
        {
          'title': 'Drink a Glass of Water First Thing in the Morning',
          'description': 'Starting your day with a full glass of water helps to aid digestion, enhance skin health, and boost energy.',
        },
        {
          'title': 'Make Half Your Plate Veggies',
          'description': 'Making half your plate veggies at each meal helps to pack in essential vitamins, minerals, and fiber, aiding digestion and keeping you feeling full longer.',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tips'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: tipsTopics.length,
        itemBuilder: (context, index) {
          return _buildListItem(context, tipsTopics[index]);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> topic) {
    return ListTile(
      title: Text(topic['title']),
      subtitle: Text(topic['description']),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipsDetailPage(title: topic['title'], subtopics: topic['subtopics']),
          ),
        );
      },
    );
  }
}

class TipsDetailPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> subtopics;

  TipsDetailPage({required this.title, required this.subtopics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: subtopics.length,
        itemBuilder: (context, index) {
          return _buildSubtopicItem(context, subtopics[index]);
        },
      ),
    );
  }

  Widget _buildSubtopicItem(BuildContext context, Map<String, dynamic> subtopic) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(subtopic['title']),
        subtitle: Text(subtopic['description']),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}


// Settings Page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';
  bool _darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Theme Setting
          ListTile(
            title: Text('Theme'),
            subtitle: Text(_darkTheme ? 'Dark' : 'Light'),
            trailing: Switch(
              value: _darkTheme,
              onChanged: (value) {
                setState(() {
                  _darkTheme = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                _darkTheme = !_darkTheme;
              });
            },
          ),
          Divider(),

          // Notifications Setting
          ListTile(
            title: Text('Notifications'),
            subtitle: Text(_notificationsEnabled ? 'Enabled' : 'Disabled'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),

          // Language Setting
          ListTile(
            title: Text('Language'),
            subtitle: Text(_selectedLanguage),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showLanguageDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Spanish'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Spanish';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('French'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'French';
                  });
                  Navigator.of(context).pop();
                },
              ),
              // Add more languages as needed
            ],
          ),
        );
      },
    );
  }
}


// Q&A Page
class QandAPage extends StatefulWidget {
  @override
  _QandAPageState createState() => _QandAPageState();
}

class _QandAPageState extends State<QandAPage> {
  final List<Map<String, String>> qaData = [
    {
      'question': '',
      'answer': ''
    },
    // Add more blank questions and answers here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A'),
        backgroundColor: Color.fromRGBO(243, 177, 160, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: qaData.map((qa) => _buildQuestionForm(qa['question']!, qa['answer']!)).toList(),
      ),
    );
  }

  Widget _buildQuestionForm(String question, String answer) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.isEmpty ? 'Enter your question here' : question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer.isEmpty ? 'Enter your answer here' : answer,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// Main App
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Diet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/food_nutritions': (context) => NutritionPage(),
        '/hydration': (context) => HydrationPage(),
        '/suggestion': (context) => SuggestionPage(),
        '/goals': (context) => GoalsPage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
        '/qanda': (context) => QandAPage(),
        '/rating': (context) => RatingPage(),
        '/form': (context) => MyCustomForm(),
      },
    );
  }
}
