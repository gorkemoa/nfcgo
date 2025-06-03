import 'package:flutter/material.dart';

class VerificationViewModel extends ChangeNotifier {
  // Controller'lar
  final TextEditingController codeController = TextEditingController();
  
  // State değişkenleri
  bool _hasError = false; // Başlangıçta hata yok
  
  // Getter'lar
  bool get hasError => _hasError;
  
  // Onay kodunu doğrula
  void verifyCode() {
    // Onay kodu doğrulama işlemleri burada olacak
    // Örnek: Onay kodu "1234" ise başarılı, değilse hatalı
    if (codeController.text == "1234") {
      _hasError = false;
    } else {
      _hasError = true;
    }
    notifyListeners();
  }
  
  // Başarılı doğrulama sonrası yönlendirme
  void navigateAfterVerification(BuildContext context) {
    // Doğrulama sonrası yönlendirme işlemi
  }
  
  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
} 