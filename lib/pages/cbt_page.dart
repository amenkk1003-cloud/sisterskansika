import 'package:flutter/material.dart';
import '../widgets/app_header.dart';

class CbtPage extends StatelessWidget {
  const CbtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppHeader(title: 'CBT'),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/cbt_illustration.png', width: 360),
                const SizedBox(height: 16),
                const Text('CBT Segera Hadir!',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                const Text('Fitur CBT sedang kami siapkan. Tunggu sebentar, ya!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
