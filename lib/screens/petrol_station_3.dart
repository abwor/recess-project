
// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gas/product_details.dart';
import 'package:gas/cart_screen.dart';
import 'package:gas/cart_provider.dart'; // Assuming you have a CartProvider

// ignore: camel_case_types
class PetrolStation3 extends StatelessWidget {
  static const routeName = '/petrolstation3';

  const PetrolStation3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose products'),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.cartShopping),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'LPG'),
              Tab(text: 'LPG Accessories'),
              Tab(text: 'All'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductGrid(category: 'LPG'),
            ProductGrid(category: 'LPG Accessories'),
            ProductGrid(category: 'All'),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            FaIcon(FontAwesomeIcons.home, size: 26),
            FaIcon(FontAwesomeIcons.userAlt, size: 26),
            FaIcon(FontAwesomeIcons.bars, size: 26),
          ],
          color: const Color.fromARGB(255, 50, 9, 207),
          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 184, 197, 186),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            // Handle button tap
            // You can add navigation or actions based on the index here
          },
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final String category;

  const ProductGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = _getProductsByCategory(category);
    return GridView.count(
      crossAxisCount: 2,
      children: products
          .map(
            (product) => _buildGridItem(
              context,
              product['assetPath'],
              product['title'],
              product['price'],
              product['description'],
              product['costSplit'],
              product['usageInstructions'],
            ),
          )
          .toList(),
    );
  }

  List<Map<String, dynamic>> _getProductsByCategory(String category) {
    final allProducts = [
      {
        'assetPath': 'assets/images/rubis6kg.jpeg',
        'title': 'Refill',
        'price': 55000,
        'category': 'LPG',
        'description': 'Compact & Safe. Ideal for small families.',
        'costSplit': 'LPG 6KG\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t53000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/rubis12.jpeg',
        'title': 'New Kits',
        'price': 211000,
        'category': 'LPG',
        'description': 'Complete kit for new users.',
        'costSplit': 'LPG Kit\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t211000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/rubis6kg.webp',
        'title': 'New Kits',
        'price': 211000,
        'category': 'LPG',
        'description': 'Compact & Safe. Ideal for small families.',
        'costSplit': 'LPG 6KG\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t53000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/rubisburner.jpeg',
        'title': 'Gas Burner',
        'price': 27500,
        'category': 'LPG Accessories',
        'description': 'Durable gas burner.',
        'costSplit': 'Burner\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t27500Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/rubisgrill.jpg',
        'title': 'Meko Grill',
        'price': 20000,
        'category': 'LPG Accessories',
        'description': 'Compact & Safe. Ideal for small families.',
        'costSplit': 'LPG 6KG\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t53000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/6rega.webp',
        'title': 'Regulators',
        'price': 30000,
        'category': 'LPG Accessories',
        'description': 'Regulator for gas cylinders.',
        'costSplit': 'Regulator\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t30000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/hospiper.jpg',
        'title': 'Hosepipe',
        'price': 26000,
        'category': 'LPG Accessories',
        'description': 'Durable gas hosepipe.',
        'costSplit': 'Hosepipe\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t26000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      // Add more products here
    ];

    if (category == 'All') {
      return allProducts;
    } else {
      return allProducts.where((product) => product['category'] == category).toList();
    }
  }

  Widget _buildGridItem(
      BuildContext context, String assetPath, String title, double price, String description, String costSplit, String usageInstructions) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              image: assetPath,
              title: title,
              price: price,
              description: description,
              costSplit: costSplit,
              usageInstructions: usageInstructions,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetPath, height: 100, width: 100),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Starting at $price Ush', style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You need to implement your CartScreen here
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: const Center(
        child: Text('Cart is empty'), // This is just a placeholder
      ),
    );
        
    
  }
}

class CartProvider with ChangeNotifier {
  // Example CartProvider for state management
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners();
  }
}

class ProductDetails extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String description;
  final String costSplit;
  final String usageInstructions;

  const ProductDetails({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.costSplit,
    required this.usageInstructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  image, // Display the passed image
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, color: Colors.red, size: 12),
                    SizedBox(width: 8),
                    Icon(Icons.circle_outlined, color: Colors.grey, size: 12),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Variants',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildVariantButton('6KG', 1495.0, true),
                  const SizedBox(width: 16),
                  _buildVariantButton('13KG', 3330.0, false),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Product Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 16),
              const Text(
                'Cost Split',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(costSplit),
              const SizedBox(height: 16),
              const Text(
                'How to use ?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(usageInstructions),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total\n$price KES',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addToCart({
                        'image': image,
                        'title': title,
                        'price': price,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVariantButton(String variant, double price, bool isSelected) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // Handle variant selection
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Column(
          children: [
            Text(variant),
            const SizedBox(height: 4),
            Text('$price KES'),
          ],
        ),
      ),
    );
  }
}

 

