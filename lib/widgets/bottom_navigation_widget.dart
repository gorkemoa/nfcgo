import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;
  
  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          // Home
          _buildNavItem(
            icon: Icons.home,
            isSelected: currentIndex == 0,
            onTap: () => onTabChanged(0),
          ),
          
          // Kartlar
          _buildNavItem(
            icon: Icons.credit_card_outlined,
            isSelected: currentIndex == 1,
            onTap: () => onTabChanged(1),
          ),
          
          // Profil
          _buildNavItem(
            icon: currentIndex == 2 ? Icons.person : Icons.person_outline,
            isSelected: currentIndex == 2,
            onTap: () => onTabChanged(2),
          ),
          
          // Mesajlar - Badge ile
          Stack(
            children: [
              _buildNavItem(
                icon: Icons.chat_bubble_outline,
                isSelected: currentIndex == 3,
                onTap: () => onTabChanged(3),
              ),
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xFF78BE20),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      currentIndex == 2 ? '10' : '1',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Avatar
          GestureDetector(
            onTap: () => onTabChanged(2),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/profile/user_avatar.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF78BE20),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'D',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF78BE20) : Colors.grey,
          size: 20,
        ),
      ),
    );
  }
} 