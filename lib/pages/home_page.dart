import 'package:flutter/material.dart';
import 'package:myapp/components/footer.dart'; // Import Footer
import 'package:myapp/components/product_cart.dart'; // Import ProductCard

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Tracks the selected page
  String _searchQuery = ''; // Tracks the search query

  // Static list of products
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl':
          'https://i.ibb.co/m916zHn/15158c3e-30f0-42bd-bd48-9c9450032967.jpg',
      'title': 'Product 1',
      'description': 'This is a description for product 1.',
      'price': '20.99',
      'tags': ['Tag 1', 'Tag 2'],
    },
    {
      'imageUrl':
          'https://i.ibb.co/m916zHn/15158c3e-30f0-42bd-bd48-9c9450032967.jpg',
      'title': 'Product 2',
      'description': 'This is a description for product 2.',
      'price': '35.50',
      'tags': ['Tag 2', 'Tag 3'],
    },
    {
      'imageUrl':
          'https://i.ibb.co/m916zHn/15158c3e-30f0-42bd-bd48-9c9450032967.jpg',
      'title': 'Product 3',
      'description': 'This is a description for product 3.',
      'price': '50.75',
      'tags': ['Tag 1', 'Tag 3'],
    },
    {
      'imageUrl':
          'https://i.ibb.co/m916zHn/15158c3e-30f0-42bd-bd48-9c9450032967.jpg',
      'title': 'Product 4',
      'description': 'This is a description for product 4.',
      'price': '45.60',
      'tags': ['Tag 4', 'Tag 5'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered products based on the search query
    final List<Map<String, dynamic>> filteredProducts = products
        .where((product) =>
            product['title'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 115, 191, 219), // Header color
        title:
            const Text('Market Place', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_basket_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              // Redirect to checkout page
              Navigator.pushNamed(context, '/checkout');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: const TextStyle(
                  fontSize: 14), // Text style for thinner appearance
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                hintText: 'Search peti peti',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor:
                    Colors.grey.shade200, // Light background for a modern look
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Slightly rounded corners
                  borderSide:
                      BorderSide.none, // Removes the border for a cleaner look
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(
                        255, 115, 191, 219), // Highlight on focus
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.47,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: filteredProducts[index]['imageUrl'],
                  title: filteredProducts[index]['title'],
                  description: filteredProducts[index]['description'],
                  price: double.parse(filteredProducts[index]['price']),
                  tags: List<String>.from(filteredProducts[index]['tags']),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
