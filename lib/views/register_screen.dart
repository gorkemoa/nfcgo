import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
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
                        const SizedBox(height: 150),                        
                        // Kayıt Formu
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              // Alt kartlar ve ana kart
                              Container(
                                height: 550, // Kartların görünmesi için alan sağla
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    // En alttaki kart (5. kart)
                                    Positioned(
                                      top: 16,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.72,
                                        height: 60,
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
                                    
                                    // 4. kart
                                    Positioned(
                                      top: 399,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.70,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
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
                                      top: 411,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.79,

                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.03),
                                              blurRadius: 2,
                                              spreadRadius: 1,
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
                                      elevation: 4,
                                      color: Colors.white,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
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
                                                
                                                // Hata mesajı - sadece hata varsa göster
                                                if (viewModel.hasError)
                                                  const Text(
                                                    'E-posta adresiniz kayıtlı',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                const SizedBox(height: 24),
                                                
                                                // Ad Soyad alanı
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: TextField(
                                                    controller: viewModel.nameController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Adınız Soyadınız',
                                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                                      prefixIcon: Icon(
                                                        Icons.person_outline,
                                                        color: Colors.grey[400],
                                                      ),
                                                      border: InputBorder.none,
                                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                                    ),
                                                  ),
                                                ),
                                                
                                                const SizedBox(height: 16),
                                                
                                                // Kullanıcı adı alanı
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: TextField(
                                                    controller: viewModel.usernameController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Kullanıcı Adınız',
                                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                                      prefixIcon: Icon(
                                                        Icons.person_outline,
                                                        color: Colors.grey[400],
                                                      ),
                                                      border: InputBorder.none,
                                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                                    ),
                                                  ),
                                                ),
                                                
                                                const SizedBox(height: 12),
                                                
                                                // E-posta alanı
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: TextField(
                                                    controller: viewModel.emailController,
                                                    decoration: InputDecoration(
                                                      hintText: 'E-posta Adresi',
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
                                                
                                                const SizedBox(height: 12),
                                                
                                                // Şifre alanı
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: TextField(
                                                    controller: viewModel.passwordController,
                                                    obscureText: !viewModel.isPasswordVisible,
                                                    decoration: InputDecoration(
                                                      hintText: '********',
                                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                                      prefixIcon: Icon(
                                                        Icons.lock_outline,
                                                        color: Colors.grey[400],
                                                      ),
                                                      border: InputBorder.none,
                                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                                    ),
                                                  ),
                                                ),
                                                
                                                const SizedBox(height: 20),
                                                
                                                // Kaydol butonu (yeşil ok)
                                                Container(
                                                  width: 90,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF78BE20),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      viewModel.register();
                                                      viewModel.navigateToVerification(context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size: 30,
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
                        
                        const Spacer(),
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