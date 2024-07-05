import 'package:flutter/material.dart';
import 'package:gas/screens/petrol_one.dart';
import 'package:gas/screens/petrol_station_2.dart';
import 'package:gas/screens/petrol_station_3.dart';
import 'package:gas/screens/petrol_station_4.dart';

void main() {
  runApp(const PetrolStationApp());
}

class PetrolStationApp extends StatelessWidget {
  const PetrolStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INSTAGAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        petrol_one.routeName: (context) => const petrol_one(),
        PetrolStation2.routeName: (context) => const PetrolStation2(),
        PetrolStation3.routeName: (context) => const PetrolStation3(),
        PetrolStation4.routeName: (context) => const PetrolStation4(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Option> options = [
    Option('assets/rubis.jpg', petrol_one.routeName, 'Rubis'),
    Option('assets/shell.jpg', PetrolStation2.routeName, 'Shell'),
    Option('assets/stabex.jpg', PetrolStation3.routeName, 'Stabex'),
    Option('assets/total.jpg', PetrolStation4.routeName, 'TotalEnergies'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome! \nPlease choose your gas station',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(9.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9.0,
          mainAxisSpacing: 9.0,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return OptionCard(option: options[index]);
        },
      ),
    );
  }
}

class Option {
  final String assetPath;
  final String route;
  final String title;

  const Option(this.assetPath, this.route, this.title);
}

class OptionCard extends StatelessWidget {
  final Option option;

  const OptionCard({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, option.route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                child: Image.asset(
                  option.assetPath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                option.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
