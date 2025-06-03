import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/verification_viewmodel.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerificationViewModel(),
      child: Consumer<VerificationViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Stack(
              children: [
                // Arka plan görseli
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Giriş Yap – 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                // Sayfa içeriği
                SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 180),
                        
                        // Onay Kodu Formu
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              // Alt kartlar ve ana kart
                              Container(
                                height: 300, // Kartların görünmesi için alan sağla
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    // Alt kartlar (gölgeler)
                                    // En alttaki kart
                                    Positioned(
                                      top: 40,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.75,
                                        height: 230,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.03),
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    // 3. kart
                                    Positioned(
                                      top: 20,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.80,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 255, 255, 255),
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.03),
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                               
                                    
                                    // Ana kart
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      margin: EdgeInsets.zero,
                                      elevation: 4,
                                      color: Colors.white,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.91,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Başlık
                                                const Text(
                                                  'Kaydol',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                
                                                // Hata mesajı sadece hata durumunda görünür
                                                if (viewModel.hasError)
                                                  const Text(
                                                    'Onay kodunuz hatalı',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                const SizedBox(height: 24),
                                                
                                                // Onay Kodu alanı
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: TextField(
                                                    controller: viewModel.codeController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Onay Kodunuz',
                                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                                      prefixIcon: Icon(
                                                        Icons.mail_outline,
                                                        color: Colors.grey[400],
                                                      ),
                                                      border: InputBorder.none,
                                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                                    ),
                                                  ),
                                                ),
                                                
                                                const SizedBox(height: 24),
                                                
                                                // Onay butonu (yeşil ok)
                                                Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () => viewModel.verifyCode(),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color(0xFF78BE20),
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                    child: const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 