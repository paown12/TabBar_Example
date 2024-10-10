// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Explore Tabs',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          centerTitle: true,
          elevation: 15,
          shadowColor: Colors.tealAccent,
          bottom: TabBar(
              indicator: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20), //rounded corners for indicator
                color: Colors.tealAccent.withOpacity(0.3),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.tealAccent, //active tab text color
              unselectedLabelColor: Colors.white, //inactive tab text color
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'Settings',
                ),
              ]),
        ),
        body: TabBarView(children: [
          _buildTabContent(
              icon: Icons.home,
              title: 'Welcome to Home',
              description: 'You see the main content here.'),
          _buildTabContent(
              icon: Icons.person,
              title: 'Profile Overview',
              description: 'Your profile details are displayed here.'),
          _buildTabContent(
              icon: Icons.settings,
              title: 'App Settings',
              description: 'You can adjust your settings here.'),
        ]),
      ),
    );
  }
}

//custom method for building tab content to simplify the code and avoid code repeat
Widget _buildTabContent({IconData? icon, String? title, String? description}) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 100,
                color: Colors.tealAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title!,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.tealAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
