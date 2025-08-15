import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas10/texfrom.dart';
import 'package:ppkd_b_3/tugas11/model/user.dart';
import 'package:ppkd_b_3/tugas11/sqfilite/db_helper.dart';
// import 'package:ppkd_b_3/day_15/textform.dart';
// import 'package:ppkd_b_3/day_16/model/user.dart';
// import 'package:ppkd_b_3/day_16/sqflite/db_helper.dart';

class Day16UserScreen extends StatefulWidget {
  const Day16UserScreen({super.key});

  @override
  State<Day16UserScreen> createState() => _Day16UserScreenState();
}

class _Day16UserScreenState extends State<Day16UserScreen> {
  List<Game> game = [];
  @override
  void initState() {
    super.initState();
    getGame();
  }

  final TextEditingController judulController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();

  Future<void> getGame() async {
    final dataGame = await DbHelper.getAllUsers();
    setState(() {
      game = dataGame;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormConst(hintText: "Judul", controller: judulController),
            TextFormConst(hintText: "kategori", controller: kategoriController),
            TextFormConst(hintText: "tahun", controller: tahunController),
            ElevatedButton(
              onPressed: () async {
                final judul = judulController.text.trim();
                final kategori = kategoriController.text.trim();
                final tahun = tahunController.text.trim();
                if (judul.isEmpty || kategori.isEmpty || tahun.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Email, Password, dan Nama tidak boleh kosong",
                      ),
                    ),
                  );

                  return;
                }
                final game = Game(
                  judul: judul,
                  kategori: kategori,
                  tahun: tahun,
                );
                await DbHelper.registerUser(game);
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pendaftaran berhasil")),
                  );
                });
                getGame();
                setState(() {});
              },
              child: Text("Simpan Data"),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: game.length,
              itemBuilder: (BuildContext context, int index) {
                final dataUserLogin = game[index];
                return ListTile(
                  title: Text(dataUserLogin.judul),
                  subtitle: Text(dataUserLogin.kategori),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
