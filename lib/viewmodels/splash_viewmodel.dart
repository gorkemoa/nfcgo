import 'package:flutter/material.dart';
import 'dart:async';
import '../views/welcome_screen.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    // Splash ekranında 3 saniye bekledikten sonra karşılama ekranına yönlendirilecek
    Timer(const Duration(seconds: 3), () {
      navigateToWelcome();
    });
  }

  void navigateToWelcome() {
    // ViewModel'den bildirilen bir yönlendirme
    notifyListeners();
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }
} 