import 'package:flutter/material.dart';
import 'package:myapp/components/footer.dart'; // Import Footer

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    double total = 0;
    for (var product in products) {
      total += double.parse(product['price']);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Page'),
      ),
      body: Stack(
        children: [
          // Scrollable List of Products
          Padding(
            padding: const EdgeInsets.only(
                bottom: 100), 
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover, 
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${product['price']}',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${product['title']} removed from cart'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                          ),
                          child: const Text('Remove',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Total Price
          Positioned(
            bottom: 70,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Buy Button at the Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity, // Full screen width
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to Payment...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(
        selectedIndex: 2, 
      ),
    );
  }
}
