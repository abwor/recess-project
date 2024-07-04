// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyGas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/total.jpg', // Add your image assets here
    'assets/images/easygas2.png',
    'assets/images/easygas3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASYGAS'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // Navigate to About Us screen
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Navigate to Contact Us screen
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                 enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: imgList.map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              )).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Hello,',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Thanks for visiting EasyGas. Would you like to place an order?',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.add_shopping_cart),
                    title: Text('Place new order'),
                    subtitle: Text('Few clicks away'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to place new order screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Repeat my Previous Order'),
                    subtitle: Text('Login to view'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to repeat previous order screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.track_changes),
                    title: Text('Follow my Ongoing Order'),
                    subtitle: Text('Login to view'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to follow ongoing order screen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
  
  CarouselSlider({required CarouselOptions options, required List<Container> items}) {}
}

class CarouselOptions {
}
