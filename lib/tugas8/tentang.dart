import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul Aplikasi',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ini adalah aplikasi contoh yang digunakan untuk menampilkan informasi deskripsi aplikasi. '
              'Aplikasi ini dibuat dengan Flutter dan sangat mudah digunakan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Pembuat:', style: Theme.of(context).textTheme.titleMedium),
            const Text(
              'Nama Pembuat: John Doe',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Versi Aplikasi:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text('Versi 1.0.0', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: AboutAppPage()));
}
