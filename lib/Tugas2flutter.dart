import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas3dan4/tugas3flutter.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text("COMPANY PROFIL SAYA"),
        actions: [Icon(Icons.favorite, color: const Color.fromARGB(255, 2, 4, 36),),],
        backgroundColor: const Color.fromARGB(255, 90, 3, 231), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tugas3Widget()),
          );
        },
        child: Icon(Icons.arrow_right_outlined),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("M. Khoerulliansyah", style: TextStyle(fontFamily: "Bitcount", fontSize: 20
            ),
            ),
          ),
          SizedBox(height: 20,),

         Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              color: const Color.fromARGB(255, 223, 226, 225), 
              child: Row(
                children: [
                  Icon(Icons.email, color: const Color.fromARGB(255, 3, 8, 36)),
                  SizedBox(width: 10),
                  Text("mkhoerulliansyah09.com"),
                ],
              ),
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.greenAccent, 
              child: Row(
                children: [
                  Icon(Icons.phone, color: Colors.red),
                  SizedBox(width: 10),
                  Text("089601175479"),
                  Spacer()
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.greenAccent, 
              child: Row(
                children: [
                  Icon(Icons.info, color: const Color.fromARGB(255, 33, 145, 219)),
                  SizedBox(width: 10),
                  Text("""Saya seorang freshgraduade yang akan memulai karir di bidang IT,Teknisi AC, Teknisi CCTV, Teknisi listrik"""),
                  Spacer()
                ],
              ),
            ),
          ),
        ],
      )
      );
  }
}