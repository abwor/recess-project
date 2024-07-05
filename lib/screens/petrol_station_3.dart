// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gas/product_details.dart';
import 'package:gas/screens/cart_screen.dart';
import 'package:gas/cart_provider.dart';
import 'package:gas/screens/profile.dart';

class PetrolStation3 extends StatelessWidget {
  static const routeName = '/petrolstation3';

  const PetrolStation3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/stabex.jpg',
            
            height: 40,
          ),
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
          color: const Color.fromARGB(255, 34, 37, 230),
          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 197, 51, 6),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            // Handle button tap
            if (index == 0) {
              // Navigate to home
              Navigator.popUntil(context, ModalRoute.withName('/'));
            } else if (index == 1) {
              // Navigate to profile
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            } else if (index == 2) {
              // Handle other action or navigation
            }
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
        'assetPath': 'assets/images/stabex1.jpg',
        'title': 'Refill',
        'price': 55000,
        'category': 'LPG',
        'description': 'Compact & Safe. Ideal for small families.',
        'costSplit': 'LPG 6KG\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t53000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/stabex2.jpeg',
        'title': 'New Kits',
        'price': 211000,
        'category': 'LPG',
        'description': 'Complete kit for new users.',
        'costSplit': 'LPG Kit\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t211000Ush',
        'usageInstructions': 'Step 1: Ensure that the burner knob is in an off position.\nStep 2: Screw the burner into the valve taking care not to damage the threads until it locks firmly into place.\nStep 3: Turn on the gas.'
      },
      {
        'assetPath': 'assets/images/stabex3.jpeg',
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
            Image.asset(assetPath, height: 158, width: 200),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cartItems = cartProvider.cartItems;
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return ListTile(
                leading: Image.asset(cartItem.image),
                title: Text(cartItem.title),
                subtitle: Text('Ugx ${cartItem.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cartProvider.removeFromCart(cartItem);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'), // This is just a placeholder
      ),
    );
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
      ),
      body: Column(
        children: [
          Image.asset(image),
          Text(title, style: const TextStyle(fontSize: 24)),
          Text('Price: UGX $price', style: const TextStyle(fontSize: 20)),
          Text('Description: $description'),
          Text('Cost Split: $costSplit'),
          Text('Usage Instructions: $usageInstructions'),
        ],
      ),
    );
  }
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}

class CartItem {
  final String image;
  final String title;
  final double price;

  CartItem({required this.image, required this.title, required this.price});
}
