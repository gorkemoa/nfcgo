import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';
import '../widgets/bottom_navigation_widget.dart';

class ProfileScreen extends StatelessWidget {
  final bool isMainScreen;
  
  const ProfileScreen({super.key, this.isMainScreen = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // Ana içerik
                SafeArea(
                  child: Column(
                    children: [
                      // Üst navigasyon
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Boş alan (geri butonu olmayacak)
                            const SizedBox(width: 36),
                            
                            // Logo
                            Row(
                              children: [
                                const Text(
                                  'NFC',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Text(
                                  'Goo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF78BE20),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF78BE20),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            
                            // Paylaş butonu
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE53E3E),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              
                              // Profil avatarı
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  color: const Color(0xFF78BE20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'D',
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // İsim
                              const Text(
                                'Doğukan Ataş',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              
                              const SizedBox(height: 6),
                              
                              // Kullanıcı adı
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'nfcgoo.com/dogukantatas',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 24),
                              
                              // Kartlarım
                              Row(
                                children: [
                                  const Text(
                                    'Kartlarım',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
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
                                childAspectRatio: 1.3,
                                children: [
                                  _buildCard(
                                    title: 'İş Kartım',
                                    imagePath: 'assets/kartlar/iskartim.png',
                                    isOnline: true,
                                  ),
                                  _buildCard(
                                    title: 'Web Developer',
                                    imagePath: 'assets/kartlar/webdev.png',
                                    isOnline: false,
                                  ),
                                  _buildCard(
                                    title: 'Drone Pilot',
                                    imagePath: 'assets/kartlar/dronepilot.png',
                                    isOnline: true,
                                  ),
                                  _buildCard(
                                    title: 'İş Kartım 4',
                                    imagePath: 'assets/kartlar/iskartim4.png',
                                    isOnline: false,
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 24),
                              
                              // Etiketlerim
                              Row(
                                children: [
                                  const Text(
                                    'Etiketlerim',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              
                              // Etiketler grid
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 12,
                                childAspectRatio: 68 / 88,
                                children: [
                                  _buildTag('Anahtarım', 'assets/kartlar/iskartim.png'),
                                  _buildTag('Kedim', 'assets/kartlar/dronepilot.png'),
                                  _buildTag('Aracım', 'assets/kartlar/webdev.png'),
                                  _buildTag('Bilgisayarım', 'assets/kartlar/iskartim4.png'),
                                  _buildTag('Anahtarım', 'assets/kartlar/iskartim.png'),
                                  _buildTag('Kedim', 'assets/kartlar/dronepilot.png'),
                                  _buildTag('Aracım', 'assets/kartlar/webdev.png'),
                                  _buildTag('Bilgisayarım', 'assets/kartlar/iskartim4.png'),
                                ],
                              ),
                              
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
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
  
  Widget _buildCard({
    required String title,
    String? imagePath,
    required bool isOnline,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6), // A solid, light grey like in the reference image
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (imagePath != null)
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isOnline ? const Color(0xFF78BE20) : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151), // Dark gray for better readability
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 36,
                  height: 12,
                  child: Stack(
                    children: List.generate(4, (index) {
                      final images = [
                        'assets/kartlar/iskartim.png',
                        'assets/kartlar/webdev.png',
                        'assets/kartlar/dronepilot.png',
                        'assets/kartlar/iskartim4.png'
                      ];
                      return Positioned(
                        left: (index * 6).toDouble(),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFF3F4F6), width: 1), // Border matches card background
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              images[index],
                              width: 12,
                              height: 12,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTag(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 68,
          height: 72,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // 1. Arka plan halkası
        Container(
                width: 70,
                height: 70,
          decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 226, 226),
            shape: BoxShape.circle,
                ),
              ),
              
              // 2. Ana görsel
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 58,
                  height: 58,
                  fit: BoxFit.cover,
                ),
              ),

              // 3. Alttaki iç içe geçmiş avatarlar
              Positioned(
                bottom: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Gölgelendirilecek alanın şekli
            boxShadow: [
              BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
              ),
            ],
          ),
                  child: SizedBox(
                    width: 36,
                    height: 12,
          child: Stack(
                      children: List.generate(4, (index) {
                        final images = [
                          'assets/kartlar/iskartim.png',
                          'assets/kartlar/webdev.png',
                          'assets/kartlar/dronepilot.png',
                          'assets/kartlar/iskartim4.png'
                        ];
                        return Positioned(
                          left: (index * 6).toDouble(),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                images[index],
                                width: 12,
                                height: 12,
                                fit: BoxFit.cover,
                ),
              ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),

              // 4. Sağ üstteki yeşil durum noktası
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF78BE20),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 6),
        
        // Etiket Adı
        Text(
          title,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
} 