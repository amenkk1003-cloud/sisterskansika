import 'package:flutter/material.dart';
import '../core/app_colors.dart';

/// Header putih: "SMK NEGERI 1 BUKATEJA" + judul halaman + ikon lonceng & user.
class AppHeader extends StatelessWidget {
  final String title;
  const AppHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).padding.top + 12, 20, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('SMK NEGERI 1 BUKATEJA',
                    style: TextStyle(fontSize: 12, color: Colors.black)),
                const SizedBox(height: 2),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.navy,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const Icon(Icons.notifications_none, size: 30, color: AppColors.navy),
          const SizedBox(width: 12),
          const Icon(Icons.people_outline, size: 30, color: AppColors.navy),
        ],
      ),
    );
  }
}