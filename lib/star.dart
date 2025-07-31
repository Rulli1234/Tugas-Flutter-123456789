
import 'package:flutter/material.dart';


class LayoutLatihan extends StatefulWidget {
  const LayoutLatihan({super.key});

  @override
  State<LayoutLatihan> createState() => _LayoutLatihanState();
}

class _LayoutLatihanState extends State<LayoutLatihan> {
  String nama = "M. Khoerulliansyah";
  int umur = 25;
  String hobi = "Catur";
  String deksripsi = " Saya seorang freshgraduate yang akan memulai karir di bidang IT, sedang belajar flutter. dan saya memiliki keahlian dibidang Teknisi AC, Teknisi CCTV, dan Teknisi Listrik";
  String Cinta = " Cintai dirimu sendiri Sebelum mencintai orang lain";

  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar agar bisa responsif
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Sederhana'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 127, 68),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth < 600 ? screenWidth : 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halo 👋\nIni adalah latihan layout dengan Flutter.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  
                  _buildInfoRow(label: "Nama", value: nama),
                  _buildInfoRow(label: "Umur", value: "$umur tahun"),
                  _buildInfoRow(label: "Hobi", value: hobi),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on,),
                      Text("PPKD JAKARTA PUSAT BANGET")
                    ],
                  ),
                  _buildInfoRow(label: "deksripsi", value: deksripsi),

                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nama = "M. Khoerulliansyah";
                        umur = 25;
                        hobi = "Catur";
                        deksripsi = " Saya seorang freshgraduade yang akan memulai karir di bidang IT, sedang belajar flutter. dan saya memiliki keahlian dibidang Teknisi AC, Teknisi CCTV, dan Teknisi Listrik";
                        Cinta = " Cintai dirimu sendiri Sebelum mencintai orang lain";

                      });
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 209, 181),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Ubah Info", style: TextStyle(fontSize: 16, color: Colors.black)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 80, child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}