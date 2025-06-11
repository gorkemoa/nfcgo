import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _userName = 'dogukantatas';
  String _displayName = 'Doğukan Ataş';
  
  bool get isLoading => _isLoading;
  String get userName => _userName;
  String get displayName => _displayName;
  
  ProfileViewModel() {
    _initialize();
  }
  
  void _initialize() async {
    _setLoading(true);
    // Profil verilerini yükle
    await Future.delayed(const Duration(milliseconds: 500));
    _setLoading(false);
  }
  
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  
  void shareProfile() {
    // Profil paylaşma fonksiyonu
  }
  
  void editProfile() {
    // Profil düzenleme fonksiyonu
  }
} 