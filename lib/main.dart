import 'package:flutter/material.dart';
import 'package:travel_picks/page/country_page.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Travel Picks")),
        body: const TravelHomePage(),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.search), label: "Suche"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}
