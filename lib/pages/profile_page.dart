import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'personal_data_page.dart';
import 'login_page.dart';
import 'main_shell.dart';
import 'face_attendance_face.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String nama = 'Yafi Amelia Solikhin';
  static const String kelas = 'XI RPL';
  static const String nis = '9253';
  static const String nisn = '0107037871';

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi Log Out'),
        content: const Text(
          'Apakah kamu yakin ingin keluar dari akun?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              mainTabIndex.value = 0;

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Ya, Keluar'),
          ),
        ],
      ),
    );
  }

  void _resetWajah(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset Wajah'),
        content: const Text(
          'Apakah kamu yakin ingin mereset data wajah?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Fitur reset wajah belum terhubung ke sistem.',
                  ),
                ),
              );
            },
            child: const Text('Ya, Reset'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4F5FC),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'SMK NEGERI 1 BUKATEJA',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Profil Siswa',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF001B78),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Belum ada notifikasi.'),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color(0xFF001B78),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _logout(context),
                    icon: const Icon(
                      Icons.manage_accounts_outlined,
                      color: Color(0xFF001B78),
                    ),
                  ),
                ],
              ),
            ),

            // KONTEN PROFIL
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 24, 18, 20),
                children: [
                  // KARTU PROFIL
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.cardGradient,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF21D6A0),
                          ),
                          child: const CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 55,
                              color: Color(0xFF30506B),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          nama,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '$kelas | SMK Negeri 1 Bukateja',
                          style: TextStyle(
                            color: Color(0xFF9BFFE0),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'NIS: $nis  NISN: $nisn',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // STATISTIK KEHADIRAN
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: BoxDecoration(
                      color: AppColors.statBlue,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        _statistik('0', 'Hadir'),
                        _statistik('0', 'Hadir'),
                        _statistik('0', 'Hadir'),
                        _statistik('0', 'Hadir'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 9),

                  // POIN PELANGGARAN
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7F8E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.shield_outlined,
                            color: Color(0xFF17845B),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 9),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Poin Pelanggaran Siswa',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Tahun ajaran 2026/2027',
                                style: TextStyle(fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB5D8ED),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '0 Poin',
                            style: TextStyle(fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // MENU PROFIL
                  const Text(
                    'Profil:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF142D4E),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 7,
                    runSpacing: 9,
                    children: [
                      _menuButton(
                        icon: Icons.account_circle_outlined,
                        label: 'Data Diri',
                        color: const Color(0xFF142D4E),
                        textColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PersonalDataPage(),
                            ),
                          );
                        },
                      ),
                      _menuButton(
                        icon: Icons.face_retouching_natural,
                        label: 'Registrasi Wajah',
                        color: Colors.white,
                        textColor: const Color(0xFF30506B),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FaceAttendancePage(),
                            ),
                          );
                        },
                      ),
                      _menuButton(
                        icon: Icons.face,
                        label: 'Reset Wajah',
                        color: Colors.white,
                        textColor: Colors.red,
                        onTap: () => _resetWajah(context),
                      ),
                      _menuButton(
                        icon: Icons.logout,
                        label: 'Log Out',
                        color: Colors.white,
                        textColor: Colors.red,
                        onTap: () => _logout(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statistik(String angka, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            angka,
            style: const TextStyle(fontSize: 11),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget _menuButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 13),
      label: Text(
        label,
        style: const TextStyle(fontSize: 9),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
