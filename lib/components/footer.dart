import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int selectedIndex;

  const Footer({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Checkout',
        ),
      ],
      currentIndex: selectedIndex, // Highlight the selected tab
      onTap: (index) {
        // Notify the parent of the tap and trigger navigation
        onItemTapped(index, context);
      },
      selectedItemColor: const Color(0xFF8fcde4), // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      showUnselectedLabels: true, // Show labels for unselected items
    );
  }

  // Handler to perform navigation inside the Footer component
  void onItemTapped(int index, BuildContext context) {
    // Navigate to the selected page using routes
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home'); // Home
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/profile'); // Profile page
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/checkout'); // Checkout page
        break;
    }
  }
}