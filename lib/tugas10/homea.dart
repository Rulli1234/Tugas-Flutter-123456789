import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigator.dart';
import 'package:ppkd_b_3/tugas10/homeb.dart';

class Day15ParsingData extends StatefulWidget {
  const Day15ParsingData({super.key});

  @override
  State<Day15ParsingData> createState() => _Day15ParsingDataState();
}

class _Day15ParsingDataState extends State<Day15ParsingData> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  @override
  //  controller: emailController,
  // onChanged: (value) {
  //   setState(() {});
  // },
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            Row(children: [Text('nama lengkap')]),
            TextFormField(
              controller: nameController,
              onChanged: (p0) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Lengkap',
                labelText: 'Nama',
              ),
            ),
            TextFormField(
              controller: emailController,
              onChanged: (p0) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Masukkan Email',
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: phoneController,
              onChanged: (p0) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor Telepon',
                labelText: 'Nomor Telepon',
              ),
            ),
            TextFormField(
              controller: alamatController,
              onChanged: (p0) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Alamat Lengkap',
                labelText: 'Alamat',
              ),
            ),

            Text(
              emailController.text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              phoneController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              nameController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              alamatController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    Day15HomeB(
                      email: emailController.text,
                      name: nameController.text,
                    ),
                  );
                },
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
