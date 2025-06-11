import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../views/register_screen.dart';
import '../views/main_screen.dart';

class LoginViewModel extends ChangeNotifier {
  // Servisler
  final AuthService _authService = AuthService();
  
  // Controller'lar
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // State değişkenleri
  bool _isPasswordVisible = false;
  bool _hasError = false;
  bool _isLoading = false;
  User? _user;
  
  // Getter'lar
  bool get isPasswordVisible => _isPasswordVisible;
  bool get hasError => _hasError;
  bool get isLoading => _isLoading;
  User? get user => _user;
  
  // Login işlemi
  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _hasError = true;
      notifyListeners();
      return;
    }
    
    _isLoading = true;
    _hasError = false;
    notifyListeners();
    
    try {
      // Kullanıcı adı "1" ve şifre "1" kontrolü
      if (emailController.text.trim() == "1" && passwordController.text.trim() == "1") {
        _user = User(
          id: 1,
          username: "testuser",
          email: "test@example.com",
          token: "test_token",
          fullName: "Test Kullanıcı"
        );
        _hasError = false;
        // Home screen'e yönlendir
        // Bu yönlendirme UI tarafında yapılacak
      } else {
        // Gerçek API çağrısı (mevcut logic)
        final user = await _authService.login(
          emailController.text.trim(),
          passwordController.text.trim()
        );
        
        if (user != null) {
          _user = user;
          _hasError = false;
        } else {
          _hasError = true;
        }
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Şifre görünürlüğünü değiştir
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  
  // Kayıt ekranına yönlendir
  void navigateToRegister(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }
  
  // Main screen'e yönlendir
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
} 