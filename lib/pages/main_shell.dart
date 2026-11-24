
import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/app_bottom_nav.dart';

import 'cbt_page.dart';
import 'home_page.dart';
import 'lms_page.dart';
import 'profile_page.dart';
import 'face_attendance_face.dart';

final ValueNotifier<int> mainTabIndex = ValueNotifier<int>(0);

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: mainTabIndex,
      builder: (context, index, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: IndexedStack(
            index: index,
            children: const [
              HomePage(),
              LmsPage(),
              CbtPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            currentIndex: index,
            onTap: (i) {
              mainTabIndex.value = i;
            },
            onFaceTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FaceAttendancePage(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
