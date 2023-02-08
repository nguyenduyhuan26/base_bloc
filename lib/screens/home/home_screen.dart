import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/screens/pick_image/pick_image_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PickImageScreen(),
                      ),
                    ),
                child: const Text('Pick Image')),
          ],
        ),
      ),
    );
  }
}
