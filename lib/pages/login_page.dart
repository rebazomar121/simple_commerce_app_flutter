import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8fcde4), // Purple background
      appBar: AppBar(
        title: const Text('Login to Pet House'),
        backgroundColor: const Color(0xFF8fcde4), // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image displayed above inputs
              SizedBox(
                height: 150,
                width:
                    150, // Ensure the width and height are the same for a circle
                child: ClipOval(
                  child: Image.network(
                    'https://i.ibb.co/m916zHn/15158c3e-30f0-42bd-bd48-9c9450032967.jpg', // Replace with your image URL or asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Spacing after the image
              // Username TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              // Password TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 24.0), // Spacing before button
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage on login
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 115, 191, 219), // Button background color
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 64.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Text color
                    fontWeight:
                        FontWeight.bold, // Optional for better visibility
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
