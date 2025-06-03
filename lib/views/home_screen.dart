import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo
                          Row(
                            children: [
                              const Text(
                                'NFC',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const Text(
                                'Goo',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF78BE20),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF78BE20),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          
                          // Hoş geldin mesajı
                          const Text(
                            'Merhaba, Doğukan!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                          // Ana başlık
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Everything',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF78BE20),
                                  ),
                                ),
                                TextSpan(
                                  text: ' in one link.',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          
                          // Arama kutusu
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
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
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey[400],
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          
                          // Merkezi profil avatarı
                          Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              child: Stack(
                                children: [
                                  // Ana profil
                                  Center(
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: const CircleAvatar(
                                        radius: 58,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/120'),
                                      ),
                                    ),
                                  ),
                                  
                                  // Üst avatar
                                  Positioned(
                                    top: 0,
                                    left: 75,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                      child: const CircleAvatar(
                                        radius: 22,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                                      ),
                                    ),
                                  ),
                                  
                                  // Sol avatar
                                  Positioned(
                                    left: 0,
                                    top: 110,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/45'),
                                      ),
                                    ),
                                  ),
                                  
                                  // Sağ avatar
                                  Positioned(
                                    right: 0,
                                    bottom: 50,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/45'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          
                          // Profil Ziyaretlerim
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Profil Ziyaretlerim',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Tamamını Gör',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          Row(
                            children: [
                              // Avatar'lar
                              SizedBox(
                                width: 140,
                                child: Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 16,
                                      backgroundImage: NetworkImage('https://via.placeholder.com/32'),
                                    ),
                                    Positioned(
                                      left: 24,
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/32'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/32'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 72,
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/32'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                '+ 13 kişi daha',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF78BE20),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          
                          // Kartlarım
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Kartlarım',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Tamamını Gör',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // Kartlar grid
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.4,
                            children: [
                              // İş Kartım
                              Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.work,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 16,
                                      left: 16,
                                      child: Text(
                                        'İş Kartım',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      right: 12,
                                      child: SizedBox(
                                        width: 60,
                                        child: Stack(
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 24,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
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
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.code,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 16,
                                      left: 16,
                                      child: Text(
                                        'Web Developer',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      right: 12,
                                      child: SizedBox(
                                        width: 60,
                                        child: Stack(
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 24,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
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
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.flight,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 16,
                                      left: 16,
                                      child: Text(
                                        'Drone Pilot',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      right: 12,
                                      child: SizedBox(
                                        width: 60,
                                        child: Stack(
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 24,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
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
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 16,
                                      left: 16,
                                      child: Text(
                                        'İş Kartım 4',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      right: 12,
                                      child: SizedBox(
                                        width: 60,
                                        child: Stack(
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 24,
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: NetworkImage('https://via.placeholder.com/20'),
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
                          const SizedBox(height: 40),
                          
                          // PAYLAŞABACAĞIM
                          const Text(
                            'PAYLAŞABACAĞIM',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          
                          // Kategori avatarları
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
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
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                  
                  // Alt navigasyon bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.home, true),
                        _buildNavItem(Icons.credit_card, false),
                        _buildNavItem(Icons.person, false),
                        _buildNavItem(Icons.chat_bubble_outline, false),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF78BE20),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF78BE20),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
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
  
  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF78BE20) : Colors.grey,
        size: 24,
      ),
    );
  }
} 