import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class _Mapel {
  final String kode, nama, guru;
  final Color warna;
  final int materi, tugas;
  const _Mapel(this.kode, this.nama, this.guru, this.warna,
      {this.materi = 0, this.tugas = 0});
}

class LmsPage extends StatefulWidget {
  const LmsPage({super.key});

  @override
  State<LmsPage> createState() => _LmsPageState();
}

class _LmsPageState extends State<LmsPage> {
  final _searchC = TextEditingController();
  String _query = '';

  // TODO: ganti dengan data dari API (total 13 mata pelajaran)
  final List<_Mapel> _all = const [
    _Mapel('BIND', 'BAHASA INDONESIA', 'NUR YULIANDRIANINGTYAS, S.Pd.',
        Color(0xFF0B4F4A)),
    _Mapel('BING', 'BAHASA INGGRIS', 'YUNITA KUSUMA WARDHANI, S.Pd.',
        Color(0xFF3FA574)),
    _Mapel('BJ', 'BAHASA JAWA', '-', Color(0xFF3D2F00)),
  ];

  @override
  void dispose() {
    _searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = _all
        .where((m) =>
            m.nama.toLowerCase().contains(_query.toLowerCase()) ||
            m.guru.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          color: Colors.white,
          child: const Text(
            'LMS',
            style: TextStyle(
              color: AppColors.navyDark,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
            children: [
              _banner(),
              const SizedBox(height: 26),
              _search(),
              const SizedBox(height: 20),
              _stats(),
              const SizedBox(height: 22),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  children: [
                    Icon(Icons.checklist_rtl, color: AppColors.navyDark),
                    SizedBox(width: 8),
                    Text('Daftar Mata Pelajaran',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.navyDark,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              for (final m in list) _mapelCard(m),
            ],
          ),
        ),
      ],
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF0E2A47), Color(0xFF2563A8)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.school_outlined, color: AppColors.mint, size: 22),
              SizedBox(width: 8),
              Text('PEMBELAJARAN SISWA',
                  style: TextStyle(
                      color: AppColors.mint,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 4),
          Text('Pembelajaran',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('SMKN 1 Bukateja|XI RPL|Gasal2026/2027',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _searchC,
        onChanged: (v) => setState(() => _query = v),
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF0F2A44)),
          hintText: 'Cari mata pelajaran atau pengampu...',
          hintStyle: TextStyle(color: Color(0xFF7A8696), fontSize: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.navy,
                  fontWeight: FontWeight.w600)),
          Text(label,
              style: const TextStyle(fontSize: 16, color: AppColors.navy)),
        ],
      ),
    );
  }

  Widget _stats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.statBlue, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          _statItem('13', 'Mata Pelajaran'),
          _statItem('0', 'Materi'),
          _statItem('0', 'Tugas Aktif'),
        ],
      ),
    );
  }

  Widget _pill(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: AppColors.navy),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 17)),
        ],
      ),
    );
  }

  Widget _mapelCard(_Mapel m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                    color: m.warna, borderRadius: BorderRadius.circular(10)),
                child: Text(m.kode,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(m.nama,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 20, color: AppColors.navy),
              const SizedBox(width: 6),
              Expanded(
                child: Text(m.guru, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _pill(Icons.description_outlined, '${m.materi} Materi'),
              _pill(Icons.edit_note, '${m.tugas} Tugas'),
            ],
          ),
        ],
      ),
    );
  }
}
