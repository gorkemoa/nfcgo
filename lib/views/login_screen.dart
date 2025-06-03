import 'package:flutter/material.dart';
import 'package:nfcgo/views/register_screen.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          // Başarılı giriş kontrolü
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.user != null && !viewModel.hasError) {
              viewModel.navigateToHome(context);
            }
          });
          
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
                        const Spacer(),
                        
                        // Login Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              // Alt kartlar ve ana kart
                              Container(
                                height: 380, // Kartların görünmesi için alan sağla
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    // En alttaki kart (5. kart - yeni eklenen)
                                    Positioned(
                                      top: 40,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.72,
                                        height: 290,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    // 4. kart
                                    Positioned(
                                      top: 30,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.75,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    // 3. kart
                                    Positioned(
                                      top: 30,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.82,
                                        height: 324,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    // 2. kart
                                    Positioned(
                                      top: 10,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.83,
                                        height: 327,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
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
                                      color: Colors.grey[100],
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Başlık
                                              const Text(
                                                'Giriş Yap',
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
                                                  'E-posta veya şifre hatalı',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              const SizedBox(height: 24),
                                              
                                              // Kullanıcı adı alanı
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: TextField(
                                                  controller: viewModel.emailController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Kullanıcı Adı',
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
                                              
                                              const SizedBox(height: 24),
                                              
                                              // Giriş butonu (yeşil ok)
                                              SizedBox(
                                                width: 120,
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: viewModel.isLoading ? null : () => viewModel.login(),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: const Color(0xFF78BE20),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: viewModel.isLoading
                                                    ? const SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2.0,
                                                        ),
                                                      )
                                                    : const Icon(
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Kayıt ol butonu
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                          child: const Text(
                            'KAYIT OL',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
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