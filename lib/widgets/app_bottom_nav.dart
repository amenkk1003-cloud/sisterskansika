import 'package:flutter/material.dart';
import '../core/app_colors.dart';

/// Bottom navigation: Home, LMS, [tombol wajah], CBT, Akun.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onFaceTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onFaceTap,
  });

  Widget _item(int index, IconData icon, String label) {
    final selected = currentIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34, color: AppColors.navy),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: selected ? AppColors.navy : const Color(0xFF666666),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 76,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                _item(0, Icons.home_outlined, 'Home'),
                _item(1, Icons.school_outlined, 'LMS'),
                const SizedBox(width: 90),
                _item(2, Icons.description_outlined, 'CBT'),
                _item(3, Icons.account_circle_outlined, 'Akun'),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: onFaceTap,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: AppColors.grey, shape: BoxShape.circle),
                child: const Icon(Icons.face_unlock_outlined,
                    size: 38, color: AppColors.navy),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
