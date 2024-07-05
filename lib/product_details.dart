import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gas/screens/petrol_station_2.dart';
import 'package:provider/provider.dart';
// Import your CartProvider

class ProductDetails extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String description;
  final String costSplit;
  final String usageInstructions;

  const ProductDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.costSplit,
    required this.usageInstructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      image,
      'assets/images/stabex1.jpg',
      'assets/images/stabex2.jpeg',
    ];

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
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imageList.map((item) => Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  )).toList(),
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
                'How to use?',
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
                      // Add to cart logic
                      _addToCart(context);
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

  void _addToCart(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart({
      'image': image,
      'title': title,
      'price': price,
    });

    // Show a snackbar or dialog to confirm addition to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

