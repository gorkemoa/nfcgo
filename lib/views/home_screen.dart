import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  final bool isMainScreen;
  
  const HomeScreen({super.key, this.isMainScreen = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Stack(
              children: [
                // Tam boyutlu arka plan görseli
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg-home/image.png'),
                      fit: BoxFit.cover,
                      opacity: 0.3, // Çok soft olması için düşük opacity
                    ),
                  ),
                ),
                
                // Ana içerik
                SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Logo
                              Row(
                                children: [
                                  const Text(
                                    'NFC',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Text(
                                    'Goo',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF78BE20),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF78BE20),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              
                              // Hoş geldin mesajı
                              const Text(
                                'Merhaba, Doğukan!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              
                              // Ana başlık
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Everything',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF78BE20),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' in one link.',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              
                              // Arama kutusu
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Kişi ara...',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.search,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Merkezi profil avatarı
                              Center(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      // Büyük arka plan çemberi
                                      Center(
                                        child: Container(
                                          width: 180,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[100],
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.05),
                                                blurRadius: 15,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                      // Ana profil (merkez)
                                      Center(
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 3),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 38,
                                            backgroundColor: const Color(0xFF78BE20),
                                            child: const Text(
                                              'D',
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      // 1. Kullanıcı (Üst - 12 o'clock)
                                      Positioned(
                                        top: 15,
                                        left: 85,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.orange,
                                            child: const Text(
                                              'A',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      // 2. Kullanıcı (Sol alt - 8 o'clock)
                                      Positioned(
                                        bottom: 35,
                                        left: 30,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.blue,
                                            child: const Text(
                                              'M',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      // 3. Kullanıcı (Sağ alt - 4 o'clock)
                                      Positioned(
                                        bottom: 35,
                                        right: 30,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.purple,
                                            child: const Text(
                                              'E',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Profil Ziyaretlerim
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Profil Ziyaretlerim',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Tamamını Gör',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              
                              Row(
                                children: [
                                  // Avatar'lar
                                  SizedBox(
                                    width: 100,
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.red,
                                          child: const Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                        ),
                                        Positioned(
                                          left: 18,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.green,
                                            child: const Text('B', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 36,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.blue,
                                            child: const Text('C', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 54,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.purple,
                                            child: const Text('D', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '+ 13 kişi daha',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF78BE20),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              
                              // Kartlarım
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Kartlarım',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Tamamını Gör',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              
                              // Kartlar grid
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.6,
                                children: [
                                  // İş Kartım
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orange.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        // Ana kişi avatarı
                                        Positioned(
                                          top: 30,
                                          left: 12,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white.withOpacity(0.9),
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor: const Color(0xFF2196F3),
                                              child: const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        // Yeşil durum noktası
                                        Positioned(
                                          top: 6,
                                          right: 6,
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF78BE20),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        
                                        const Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Text(
                                            'İş Kartım',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: SizedBox(
                                            width: 45,
                                            child: Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.white.withOpacity(0.8),
                                                  child: const Icon(Icons.person, size: 8, color: Colors.orange),
                                                ),
                                                Positioned(
                                                  left: 9,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.work, size: 8, color: Colors.orange),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 18,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.business, size: 8, color: Colors.orange),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Web Developer
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFE91E63), Color(0xFFF8BBD9)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.pink.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        // Ana kişi avatarı
                                        Positioned(
                                          top: 30,
                                          right: 12,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white.withOpacity(0.9),
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor: const Color(0xFFE91E63),
                                              child: const Icon(
                                                Icons.woman,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        // Yeşil durum noktası
                                        Positioned(
                                          top: 6,
                                          right: 6,
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF78BE20),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        
                                        const Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Text(
                                            'Web Developer',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: SizedBox(
                                            width: 45,
                                            child: Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.white.withOpacity(0.8),
                                                  child: const Icon(Icons.code, size: 8, color: Colors.pink),
                                                ),
                                                Positioned(
                                                  left: 9,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.web, size: 8, color: Colors.pink),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 18,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.laptop, size: 8, color: Colors.pink),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Drone Pilot
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        // Drone/teknoloji görseli
                                        Positioned(
                                          top: 15,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: const Icon(
                                              Icons.flight,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                        
                                        // Yeşil durum noktası
                                        Positioned(
                                          top: 6,
                                          right: 6,
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF78BE20),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        
                                        const Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Text(
                                            'Drone Pilot',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: SizedBox(
                                            width: 45,
                                            child: Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.white.withOpacity(0.8),
                                                  child: const Icon(Icons.flight, size: 8, color: Colors.blue),
                                                ),
                                                Positioned(
                                                  left: 9,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.camera_alt, size: 8, color: Colors.blue),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 18,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.videocam, size: 8, color: Colors.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // İş Kartım 4
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        // Ana kişi avatarı
                                        Positioned(
                                          top: 30,
                                          right: 12,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white.withOpacity(0.9),
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor: const Color(0xFF4CAF50),
                                              child: const Icon(
                                                Icons.woman,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        // Yeşil durum noktası
                                        Positioned(
                                          top: 6,
                                          right: 6,
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF78BE20),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        
                                        const Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Text(
                                            'İş Kartım 4',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: SizedBox(
                                            width: 45,
                                            child: Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.white.withOpacity(0.8),
                                                  child: const Icon(Icons.phone, size: 8, color: Colors.green),
                                                ),
                                                Positioned(
                                                  left: 9,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.email, size: 8, color: Colors.green),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 18,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.white.withOpacity(0.8),
                                                    child: const Icon(Icons.location_on, size: 8, color: Colors.green),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              
                              const Text(
                                'ETİKETLERİM',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Kategori avatarları
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                children: [
                                  _buildCategoryItem('Analizlenim', Colors.pink, Icons.analytics),
                                  _buildCategoryItem('Kedim', Colors.indigo, Icons.pets),
                                  _buildCategoryItem('Aracım', Colors.blue, Icons.car_rental),
                                  _buildCategoryItem('Bilgisayarım', Colors.grey, Icons.computer),
                                  _buildCategoryItem('Analizlenim', Colors.pink, Icons.analytics),
                                  _buildCategoryItem('Kedim', Colors.indigo, Icons.pets),
                                  _buildCategoryItem('Aracım', Colors.blue, Icons.car_rental),
                                  _buildCategoryItem('Bilgisayarım', Colors.grey, Icons.computer),
                                ],
                              ),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ),
                      
                      // Alt navigasyon bar (sadece ana ekran değilse göster)
                      if (!isMainScreen)
                        BottomNavigationWidget(
                          currentIndex: 0,
                          onTabChanged: (int index) {
                            // Standalone sayfada bu kullanılmayacak
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildCategoryItem(String title, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF78BE20),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
  

} 