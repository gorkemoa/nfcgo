import 'package:flutter/material.dart';
import 'dart:math' as math;
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
                                child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Dış çember
                                      Container(
                                        width: 180,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.grey.shade300, width: 1.0),
                                        ),
                                      ),
                                      // İç çember
                                      Container(
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.grey.shade300, width: 1.0),
                                        ),
                                      ),
                              
                                      // Parlama efekti
                                      Positioned(
                                        bottom: 30,
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              colors: [
                                                Colors.white.withOpacity(0.7),
                                                Colors.white.withOpacity(0.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              
                                      // Ana profil (merkez)
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/kartlar/iskartim.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              
                                      _buildPositionedAvatar(
                                        'assets/kartlar/webdev.png',
                                        size: 30,
                                        angle: 35,
                                        distance: 85,
                                      ),
                                      _buildPositionedAvatar(
                                        'assets/kartlar/dronepilot.png',
                                        size: 30,
                                        angle: 155,
                                        distance: 85,
                                      ),
                                      _buildPositionedAvatar(
                                        'assets/kartlar/iskartim4.png',
                                        size: 30,
                                        angle: 295,
                                        distance: 85,
                                        isBW: true,
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
                                    width: 80,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/kartlar/iskartim.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 12,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 2),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/kartlar/webdev.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 24,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 2),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/kartlar/dronepilot.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 36,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 2),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/kartlar/iskartim4.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 227, 226, 226),
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
  
  Widget _buildPositionedAvatar(
    String imagePath, {
    required double size,
    required double angle,
    required double distance,
    bool isBW = false,
  }) {
    final double angleInRadians = angle * (math.pi / 180);
    // Stack'in merkezi 100,100 olduğu için (200x200)
    final double top = 100 - (distance * math.sin(angleInRadians)) - (size / 2);
    final double left = 100 + (distance * math.cos(angleInRadians)) - (size / 2);

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );

    if (isBW) {
      avatar = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      1, 0,
        ]),
        child: avatar,
      );
    }

    return Positioned(
      top: top,
      left: left,
      child: avatar,
    );
  }
} 