import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import '../widgets/bottom_navigation_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  
  final List<Widget> pages = [
    const HomeScreen(isMainScreen: true),
    const Center(child: Text('Kartlar Sayfası')), // Kartlar sayfası buraya eklenecek
    const ProfileScreen(),
    const Center(child: Text('Mesajlar Sayfası')), // Mesajlar sayfası buraya eklenecek
  ];
  

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: currentIndex,
        onTabChanged: onTabChanged,
      ),
    );
  }
} 