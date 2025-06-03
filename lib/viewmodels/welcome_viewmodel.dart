import 'package:flutter/material.dart';
import '../views/login_or_register_screen.dart';

class WelcomeViewModel extends ChangeNotifier {
  // Karşılama ekranı için gerekli işlemler ileride buraya eklenecek
  
  void navigateToLogin() {
    // Login ekranına yönlendirme işlemi
    notifyListeners();
  }
  
  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginOrRegisterScreen()),
    );
  }
} 