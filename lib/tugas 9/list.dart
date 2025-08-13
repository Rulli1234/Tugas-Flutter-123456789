import 'package:flutter/material.dart';

class Day14ListOnListViewBuilder extends StatefulWidget {
  const Day14ListOnListViewBuilder({super.key});

  @override
  State<Day14ListOnListViewBuilder> createState() =>
      _Day14ListOnListViewBuilderState();
}

class _Day14ListOnListViewBuilderState
    extends State<Day14ListOnListViewBuilder> {
  //Step 1
  final List<String> namaObat = [
    "Kursi Roda",
    "Infus",
    "Suntikan",
    "Kasur Jenazah",
    "Tensimeter",
    "Timbangan",
    "Kasur Pasien",
    "Oksigen",
    "Mesin X-Ray/Rongsen",
    "Rapid Test Covid 19",
  ];

  // final List<Map<String, dynamic>> produkkecantikan= [
  //   {"nama": "Paracetamol", "price": 21500, "warna": Colors.blue},
  //   {"nama": "Bodrex", "price": 76500, "warna": Colors.red},
  //   {"nama": "CTM", "price": 41500, "warna": Colors.yellow},
  //   {"nama": "Panadol", "price": 30000, "warna": Colors.green},
  //   {"nama": "Promag", "price": 48500, "warna": Colors.blue},
  //   {"nama": "Diapet", "price": 28500, "warna": Colors.red},
  //   {"nama": "Freshcare", "price": 28500, "warna": Colors.yellow},
  //   {"nama": "Konidin", "price": 32500, "warna": Colors.green},
  //   {"nama": "Komix", "price": 26500, "warna": Colors.blue},
  //   {"nama": "Neozep", "price": 27800, "warna": Colors.red},
  // ];

  // final List<ProdukModel> produkModel = [
  //   ProdukModel(nama: "Paracetamol", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Bodrex", price: 60000, warna: Colors.red),
  //   ProdukModel(nama: "CTM", price: 70000, warna: Colors.yellow),
  //   ProdukModel(nama: "Panadol", price: 80000, warna: Colors.indigoAccent),
  //   ProdukModel(nama: "Promag", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Diapet", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Freshcare", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Konidin", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Komix", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Neozep", price: 50000, warna: Colors.blue),
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //List
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: namaObat.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(namaObat[index]),
                leading: CircleAvatar(child: Text("${index + 1}")),
              );
            },
          ),
          Divider(),
          //List of Map
          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),

          //   shrinkWrap: true,
          //   itemCount: namaObat.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final dataProduk = namaObat[index];
          //     return ListTile(
          //       title: Text(dataProduk["namaobat"]),
          //       subtitle: Text(dataProduk["price"].toString()),
          //       trailing: CircleAvatar(backgroundColor: dataProduk["warna"]),
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.amber,
          //         child: Text("${index + 1}"),
          //       ),
          //     );
          //   },
          // ),
          //Model
          Divider(),

          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: namaObat.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final dataProdukModel = namaObat[index];
          //     return ListTile(
          //       title: Text(dataProdukModel.namaobat,
          //       subtitle: Text(dataProdukModel.price.toString()),
          //       trailing: CircleAvatar(backgroundColor: dataProdukModel.warna),
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.amber,
          //         child: Text("${index + 1}"),
          //       ),
        ],
      ),
    );
  }
}
