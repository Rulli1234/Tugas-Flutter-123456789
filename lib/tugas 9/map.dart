import 'package:flutter/material.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  // final List<String> namaalatkesehatan = [
  //   "Kursi Roda",
  //   "Infus",
  //   "Suntikan",
  //   "Kasur Pasien",
  //   "Tensi Meter",
  //   "Timbangan",
  //   "Kasur",
  //   "Oksigen",
  //   "Mesin X Ray / Rongsen",
  //   " Rapid Store",
  // ];

  final List<Map<String, dynamic>> produk = [
    {"nama": "Kursi Roda", "price": 2000000, "warna": Colors.blue},
    {"nama": "Infus", "price": 400000, "warna": Colors.red},
    {"nama": "Suntikan", "price": 100000, "warna": Colors.yellow},
    {"nama": "Kasur jenazah", "price": 800000, "warna": Colors.green},
    {"nama": "Tensimeter", "price": 50000, "warna": Colors.green},
    {"nama": "Timbangan", "price": 50000, "warna": Colors.green},
    {"nama": "Kasur pasien", "price": 900000, "warna": Colors.green},
    {"nama": "Oksigen", "price": 500000, "warna": Colors.green},
    {"nama": "Mesin X Ray/ Rongsen", "price": 500000, "warna": Colors.green},
    {"nama": "Rapid Test Covid 19", "price": 50000, "warna": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //List of Map
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: produk.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProduk = produk[index];
              return ListTile(
                title: Text(dataProduk["nama"]),
                subtitle: Text(dataProduk["price"].toString()),
                trailing: CircleAvatar(child: Icon(Icons.add_shopping_cart)),
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("${index + 1}"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
