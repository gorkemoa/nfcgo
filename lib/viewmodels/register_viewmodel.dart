import 'package:flutter/material.dart';
import '../views/verification_screen.dart';

class RegisterViewModel extends ChangeNotifier {
  // Controller'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // State değişkenleri
  bool _isPasswordVisible = false;
  bool _hasError = false;
  
  // Getter'lar
  bool get isPasswordVisible => _isPasswordVisible;
  bool get hasError => _hasError;
  
  // Kayıt işlemi
  void register() {
    // Kayıt işlemleri burada olacak
    _hasError = false; // Başarılı olduğunu varsayalım
    notifyListeners();
  }
  
  // Kayıt sonrası onay sayfasına yönlendirme
  void navigateToVerification(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const VerificationScreen()),
    );
  }
  
  // Şifre görünürlüğünü değiştir
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  
  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
} 