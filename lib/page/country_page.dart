//TravelHomePage
import 'package:flutter/material.dart';
import 'package:travel_picks/logic/country.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> _selectedCountries = [];

  static final List<Map<String, String>> europeCountries = [
    {"emoji": "🇮🇹", "name": "Italien"},
    {"emoji": "🇪🇸", "name": "Spanien"},
    {"emoji": "🇩🇪", "name": "Deutschland"},
    {"emoji": "🇫🇷", "name": "Frankreich"},
    {"emoji": "🇳🇴", "name": "Norwegen"},
  ];

  static final List<Map<String, String>> southAmericaCountries = [
    {"emoji": "🇧🇷", "name": "Brasilien"},
    {"emoji": "🇦🇷", "name": "Argentinien"},
    {"emoji": "🇨🇱", "name": "Chile"},
    {"emoji": "🇵🇪", "name": "Peru"},
    {"emoji": "🇨🇴", "name": "Kolumbien"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "🌎 Willkommen zu deinen Reiseinspirationen",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          CountryListWidget(
            title: "Europa",
            country: europeCountries,
            selectedCountries: _selectedCountries,
            onCountrySelected: (name) {
              if (!_selectedCountries.contains(name)) {
                setState(() {
                  _selectedCountries.add(name);
                });
              }
            },
          ),
          CountryListWidget(
            title: "Südamerika",
            country: southAmericaCountries,
            selectedCountries: _selectedCountries,
            onCountrySelected: (name) {
              if (!_selectedCountries.contains(name)) {
                setState(() {
                  _selectedCountries.add(name);
                });
              }
            },
          ),
          const SizedBox(height: 24),
          const Text("Favoriten", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _selectedCountries.map((name) {
              return Chip(
                label: Text(name),
                deleteIcon: const Icon(Icons.close),
                onDeleted: () {
                  setState(() {
                    _selectedCountries.remove(name);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
