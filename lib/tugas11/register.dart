// import 'package:flutter/material.dart';
// import 'package:ppkd_b_3/Tugas Flutter/Tugas 11 Flutter/db_helper.dart';
// import 'package:ppkd_b_3/Tugas Flutter/Tugas 11 Flutter/model.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//   static const id = "/register";

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController idController = TextEditingController();
//   final TextEditingController namaController = TextEditingController();
//   final TextEditingController hargaController = TextEditingController();

//   List<Produk> daftarProduk = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Produk Toko')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: idController,
//               decoration: InputDecoration(labelText: 'ID'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: namaController,
//               decoration: InputDecoration(labelText: 'Nama Produk'),
//             ),
//             TextField(
//               controller: hargaController,
//               decoration: InputDecoration(labelText: 'Harga'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: simpanData,
//               child: Text(
//                 'Simpan',
//                 style: TextStyle(
//                   color: const Color.fromARGB(255, 228, 93, 160),
//                 ),
//               ),
//             ),
//             Divider(height: 32),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: daftarProduk.length,
//                 itemBuilder: (context, index) {
//                   final produk = daftarProduk[index];
//                   return ListTile(
//                     leading: CircleAvatar(child: Text('${index + 1}')),
//                     title: Text(produk.nama.toString()),
//                     subtitle: Text('harga: ${produk.harga}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     muatData();
//   }

//   Future<void> muatData() async {
//     final data = await DbHelper.getAllProduk();
//     setState(() {
//       daftarProduk = data;
//     });
//   }

//   Future<void> simpanData() async {
//     final id = idController.text;
//     final nama = namaController.text;
//     final harga = int.tryParse(hargaController.text) ?? 0;

//     if (id.isNotEmpty && harga > 0) {
//       await DbHelper.insertProduk(
//         Produk(
//           id: int.tryParse(idController.text) ?? 0,
//           nama: nama,
//           harga: harga,
//         ),
//       );
//       idController.clear();
//       namaController.clear();
//       hargaController.clear();
//       muatData();
//     }
//   }
// }
