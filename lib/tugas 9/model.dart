import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas%209/produk.dart';

class Model1 extends StatefulWidget {
  const Model1({super.key});

  @override
  State<Model1> createState() => _Model1State();
}

class _Model1State extends State<Model1> {
  final List<ProdukModel> produkModel = [
    ProdukModel(nama: "Kursi Roda", price: 2000000, warna: Colors.blue),
    ProdukModel(nama: "Infus", price: 40000, warna: Colors.red),
    ProdukModel(nama: "Suntikan", price: 100000, warna: Colors.yellow),
    ProdukModel(
      nama: "Kasur Jenazah",
      price: 80000,
      warna: Colors.indigoAccent,
    ),
    ProdukModel(nama: "Tensimeter", price: 50000, warna: Colors.blue),
    ProdukModel(nama: "Timbangan", price: 50000, warna: Colors.blue),
    ProdukModel(nama: "Kasur Pasien", price: 90000, warna: Colors.blue),
    ProdukModel(nama: "Oksigen", price: 500000, warna: Colors.blue),
    ProdukModel(
      nama: "Mesin X Ray / Rongsen",
      price: 5000000,
      warna: Colors.blue,
    ),
    ProdukModel(nama: "Rapid test Covid 19", price: 50000, warna: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: produkModel.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProdukModel = produkModel[index];
              return ListTile(
                title: Text(dataProdukModel.nama),
                subtitle: Text(dataProdukModel.price.toString()),
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
