import 'package:flutter/material.dart';

class CountryListWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> country;
  final List<String> selectedCountries;
  final void Function(String countryName) onCountrySelected;

  const CountryListWidget({
    super.key,
    required this.title,
    required this.country,
    required this.selectedCountries,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(title, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: country
                .map(
                  (country) => CountryCard(
                    emoji: country["emoji"]!,
                    name: country["name"]!,
                    onTap: () => onCountrySelected(country["name"]!),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

//CountryCard
class CountryCard extends StatelessWidget {
  final String emoji;
  final String name;
  final VoidCallback? onTap;

  const CountryCard({
    super.key,
    required this.emoji,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: TextStyle(fontSize: 32)),
                const SizedBox(height: 8),
                Text(name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
