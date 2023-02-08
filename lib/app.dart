import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);
  final String flavor;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
