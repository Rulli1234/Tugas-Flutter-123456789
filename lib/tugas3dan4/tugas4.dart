import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

 Widget build(BuildContext context) {
    List<Map<String, dynamic>> namaMakanan = [
      // {
      //   "namaproduk": "Manifold",
      //   "harga": "180.000",
      //   "deskripsi": "Manifold freon adalah alat yang digunakan untuk mengukur tekanan dan mengatur aliran freon (refrigeran) dalam sistem pendingin, seperti AC rumah, AC mobil, atau kulkas.",
      //   "gambar": "assets/images/manifold2.jpg",
      // },
      // {
      //   "namaproduk": "Vacum",
      //   "harga": "2.700.000",
      //   "deskripsi": "Vakum AC adalah proses menghilangkan udara dan uap air dari sistem AC menggunakan pompa vakum. ",
      //   "gambar": "assets/images/vacum2.jpg",
      // },
      {
        "namaproduk": "Flaring",
        "harga": "120.000",
        "deskripsi": "Flaring pipa AC .",
        "gambar": "assets/images/flaring.jpeg",
      },
      {
        "namaproduk": "Refrigerant",
        "harga": "600.000",
        "deskripsi":"Refrigeran AC.",
        "gambar": "assets/images/refrigerantR22.jpeg",
      },
      {
        "namaproduk": "Tang Ampere",
        "harga": "150.000",
        "deskripsi": "Tang ampere.",
        "gambar": "assets/images/TangAmpere.jpeg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9ECDE),
      appBar: AppBar(
        title: Text(
          "Produk",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "FiraSans",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color.fromARGB(180, 5, 67, 200),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Icon(Icons.menu, size: 24, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.account_box, size: 24, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert, size: 24, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              "Pemesanan Produk",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "FiraSans",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Pemesan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Deskripsi Pembelian',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Daftar Produk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: namaMakanan.length,
              itemBuilder: (BuildContext context, int index) {
                // final data = produkLaptop[index];
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // height: 200,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: data["color"],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(4),
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    namaMakanan[index]["gambar"],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    namaMakanan[index]["namaproduk"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Harga dari Rp ${namaMakanan[index]["harga"]},000",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    namaMakanan[index]["deskripsi"],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}