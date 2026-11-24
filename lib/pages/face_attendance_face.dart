
import 'package:flutter/material.dart';

class FaceAttendancePage extends StatefulWidget {
  const FaceAttendancePage({super.key});

  @override
  State<FaceAttendancePage> createState() =>
      _FaceAttendancePageState();
}

class _FaceAttendancePageState
    extends State<FaceAttendancePage> {
  int tahap = 0;

  final String namaSiswa = 'Yafi Amelia Solikhin';

  final String lokasi =
      'SMK Negeri 1 Bukateja, Purbalingga, Jawa Tengah';

  final Color navy = const Color(0xFF092B80);
  final Color teal = const Color(0xFF65E8C2);

  // Simulasi mengambil foto
  void ambilFoto() {
    setState(() {
      tahap = 1;
    });
  }

  // Simulasi menggunakan foto
  void gunakanFoto() {
    Navigator.pop(context);

    setState(() {
      tahap = 2;
    });
  }

  // Mengulang foto
  void ambilUlang() {
    Navigator.pop(context);

    setState(() {
      tahap = 0;
    });
  }

  // Menampilkan preview foto
  void tampilkanPreview() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EAF2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 115,
                        color: navy,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Foto berhasil diambil',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: ambilUlang,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: navy,
                          side: BorderSide(
                            color: navy,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                        child: const Text('Ambil Ulang'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: gunakanFoto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                        child: const Text('Gunakan Foto'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Konfirmasi presensi
  void konfirmasiPresensi() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wajah Terdeteksi',
                  style: TextStyle(
                    color: navy,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9D0D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 29,
                        backgroundColor: navy,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          namaSiswa,
                          style: TextStyle(
                            color: navy,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  'Lokasi',
                  style: TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  lokasi,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Apakah Anda yakin melakukan presensi?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);

                          setState(() {
                            tahap = 0;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: navy,
                          side: BorderSide(color: navy),
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                        child: const Text('Tidak'),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);

                          setState(() {
                            tahap = 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                        child: const Text('Ya'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Presensi Wajah',
          style: TextStyle(
            color: Color(0xFF19365B),
            fontSize: 20,
          ),
        ),
      ),

      body: tahap == 3
          ? tampilanBerhasil()
          : tahap == 2
              ? tampilanKonfirmasi()
              : tampilanKamera(),
    );
  }

  // Halaman kamera simulasi
  Widget tampilanKamera() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xFFD6D6D6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 180,
                  color: Colors.white.withOpacity(0.8),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mode Kamera Simulasi',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: navy.withOpacity(0.75),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Pastikan wajah terlihat jelas dan tidak menggunakan masker/topeng',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        GestureDetector(
          onTap: () {
            ambilFoto();
            tampilkanPreview();
          },
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [navy, teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),

        const SizedBox(height: 35),
      ],
    );
  }

  // Halaman konfirmasi
  Widget tampilanKonfirmasi() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && tahap == 2) {
        tahap = -1;
        konfirmasiPresensi();
      }
    });

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Halaman berhasil
  Widget tampilanBerhasil() {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.symmetric(
          vertical: 55,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 115,
            ),

            const SizedBox(height: 15),

            Text(
              'Presensi Berhasil',
              style: TextStyle(
                color: navy,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Simulasi presensi berhasil dilakukan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  tahap = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navy,
                foregroundColor: Colors.white,
              ),
              child: const Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
