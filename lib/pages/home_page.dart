import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/app_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  BoxDecoration get _whiteCard => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              _profileCard(),
              const SizedBox(height: 16),
              _dateCard(),
              const SizedBox(height: 16),
              _presensiCard(context),
              const SizedBox(height: 16),
              _jadwalCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFE00F1A),
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Yafi Amelia Solikhin',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('9253|XI RPL 1|SMKN 1 Bukateja',
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _batasBox(IconData icon, String label, String time) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                  color: Color(0xFFBDBDBD), shape: BoxShape.circle),
              child: Icon(icon, size: 20, color: AppColors.navy),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12)),
                Text(time,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _whiteCard,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined,
                  color: AppColors.navy, size: 24),
              const SizedBox(width: 10),
              const Text('Kamis, 29/10',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const Spacer(),
              const Text('Tahun Ajaran 2026/2027',
                  style: TextStyle(fontSize: 13, color: Color(0xFF555555))),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(color: Color(0xFFAAAAAA), height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              _batasBox(Icons.login, 'Batas Masuk', '06:00'),
              const SizedBox(width: 16),
              _batasBox(Icons.logout, 'Batas Pulang', '14:30'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color bg, Color fg, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 5),
          ],
          Text(text, style: TextStyle(fontSize: 13, color: fg)),
        ],
      ),
    );
  }

  Widget _presensiRow({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String time,
    required Widget status,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text(time, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          status,
        ],
      ),
    );
  }

  Widget _presensiCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _whiteCard,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: Color(0xFF3F6B12), shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              const Text('Presensi', style: TextStyle(fontSize: 20)),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text('Lihat semua  >',
                    style: TextStyle(color: AppColors.greenText, fontSize: 14)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _presensiRow(
            icon: Icons.alarm,
            iconBg: AppColors.mintSoft,
            iconColor: const Color(0xFF1B8A5A),
            title: 'Presensi Masuk',
            time: '06:54 | 29/10/2026',
            status: _chip(
                'Tepat Waktu', AppColors.mintSoft, const Color(0xFF1B7A4A),
                icon: Icons.check_circle),
          ),
          const SizedBox(height: 8),
          _presensiRow(
            icon: Icons.timer_outlined,
            iconBg: const Color(0xFFBDBDBD),
            iconColor: AppColors.navyDark,
            title: 'Presensi Pulang',
            time: '--:-- | --/--/--',
            status: _chip(
                'Belum Presensi', const Color(0xFFBDBDBD), AppColors.navy,
                icon: Icons.history),
          ),
        ],
      ),
    );
  }

  Widget _jadwalItem(String jam, Color jamBg, String mapel, String guru) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                    color: jamBg, borderRadius: BorderRadius.circular(6)),
                child: Text(jam,
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xFF0F3D2A))),
              ),
              const Spacer(),
              const Icon(Icons.access_time, size: 18, color: AppColors.navy),
              const SizedBox(width: 4),
              const Text('07.30-08.10', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 2),
          Text(mapel,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 18, color: AppColors.navy),
              const SizedBox(width: 6),
              Text(guru, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _jadwalCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _whiteCard,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.description_outlined,
                  color: AppColors.navyDark, size: 26),
              const SizedBox(width: 12),
              const Text('Jadwal Pelajaran',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text('Hari ini', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _jadwalItem('Jam 1-2', AppColors.mintSoft, 'MATEMATIKA',
              'Setya Rahayu, S.Pd'),
          _jadwalItem('Jam 3-4', const Color(0xFFBDBDBD), 'PEMROGRAMAN WEB',
              'Paras Taufani, S.Kom.'),
        ],
      ),
    );
  }
}
