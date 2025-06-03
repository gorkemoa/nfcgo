import 'package:flutter/material.dart';

class LoginOrRegisterViewModel extends ChangeNotifier {
  // Login işlemleri için gerekli metotlar
  
  void login() {
    // Giriş işlemleri burada yapılacak
    notifyListeners();
  }
  
  void register() {
    // Kayıt işlemleri burada yapılacak
    notifyListeners();
  }
} 