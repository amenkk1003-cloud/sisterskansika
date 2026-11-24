import 'package:flutter/material.dart';
import 'package:sister_skansika/pages/face_attendance_face.dart';
import '../core/app_colors.dart';
import '../widgets/app_bottom_nav.dart';
import 'main_shell.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  // TODO: ganti dengan data dari API
  static const _personal = <List<String>>[
    ['Nama', 'Yafi Amelia Solikhin'],
    ['Tempat Lahir', 'Purbalingga'],
    ['Tanggal Lahir', '18 Maret 2010'],
    ['Jenis Kelamin', 'Perempuan'],
    ['Telepon', '-'],
    ['NIS', '9253'],
    ['NISN', '0107037871'],
    ['NIK', '-'],
    ['Agama', 'Islam'],
    ['Alamat', 'Toyareja Toyareja Kec. Purbalingga Kab. Purbalingga'],
    ['Anak Ke-', '-'],
    ['Status Anak', '-'],
    ['Asal Sekolah', '-'],
    ['Nomor Surat Tanda Lulus', '-'],
    ['Tanggal Surat Tanda Lulus', '-'],
  ];
  static const _ortu = <List<String>>[
    ['Nama Ayah', '-'],
    ['Pekerjaan Ayah', '-'],
    ['Nama Ibu', '-'],
    ['Pekerjaan Ibu', '-'],
    ['Alamat Orangtua', '-'],
    ['Telepon Orangtua', '-'],
  ];
  static const _wali = <List<String>>[
    ['Nama Wali Murid', '-'],
    ['Pekerjaan Wali Murid', '-'],
    ['Alamat Wali Murid', '-'],
    ['Telepon Wali Murid', '-'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _PersonalDataHeader(title: 'Data Diri'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(10, 14, 10, 24),
              children: [
                _section(Icons.person, 'Data Personal', _personal),
                const SizedBox(height: 14),
                _section(Icons.group, 'Data Orang Tua', _ortu),
                const SizedBox(height: 14),
                _section(Icons.shield, 'Data Wali Murid', _wali),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 3,
        onTap: (i) {
          mainTabIndex.value = i;
          Navigator.pop(context); // kembali ke MainShell dengan tab terpilih
        },
        onFaceTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FaceAttendancePage()),
        ),
      ),
    );
  }

  Widget _section(IconData icon, String title, List<List<String>> rows) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 14, 8, 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
                color: const Color(0xFF30506B),
                borderRadius: BorderRadius.circular(22)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppColors.mint, size: 26),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          for (final r in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text(r[0], style: const TextStyle(fontSize: 17)),
                  ),
                  Expanded(
                    child: Text(r[1],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PersonalDataHeader extends StatelessWidget {
  const _PersonalDataHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top + 16,
        16,
        16,
      ),
      color: const Color(0xFF30506B),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
