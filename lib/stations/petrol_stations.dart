import 'package:flutter/material.dart';

void main() {
  runApp(PetrolStationApp());
}

class PetrolStationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petrol Station App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        PetrolStation1.routeName: (context) => PetrolStation1(),
        PetrolStation2.routeName: (context) => PetrolStation2(),
        PetrolStation3.routeName: (context) => PetrolStation3(),
        PetrolStation4.routeName: (context) => PetrolStation4(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Option> options = [
    Option('Petrol Station 1', Icons.local_gas_station, PetrolStation1.routeName),
    Option('Petrol Station 2', Icons.local_gas_station, PetrolStation2.routeName),
    Option('Petrol Station 3', Icons.local_gas_station, PetrolStation3.routeName),
    Option('Petrol Station 4', Icons.local_gas_station, PetrolStation4.routeName),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petrol Station Options'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
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
  final String name;
  final IconData icon;
  final String route;

  Option(this.name, this.icon, this.route);
}

class OptionCard extends StatelessWidget {
  final Option option;

  OptionCard({required this.option});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, option.route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              option.icon,
              size: 50.0,
              color: Colors.blue,
            ),
            SizedBox(height: 10.0),
            Text(
              option.name,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PetrolStation1 extends StatelessWidget {
  static const routeName = '/petrol-station-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petrol Station 1'),
      ),
      body: Center(
        child: Text(
          'Welcome to Petrol Station 1',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class PetrolStation2 extends StatelessWidget {
  static const routeName = '/petrol-station-2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petrol Station 2'),
      ),
      body: Center(
        child: Text(
          'Welcome to Petrol Station 2',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class PetrolStation3 extends StatelessWidget {
  static const routeName = '/petrol-station-3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petrol Station 3'),
      ),
      body: Center(
        child: Text(
          'Welcome to Petrol Station 3',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class PetrolStation4 extends StatelessWidget {
  static const routeName = '/petrol-station-4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petrol Station 4'),
      ),
      body: Center(
        child: Text(
          'Welcome to Petrol Station 4',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}