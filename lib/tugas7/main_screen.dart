import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigator.dart';
import 'package:ppkd_b_3/tugas7/checkbox.dart';
import 'package:ppkd_b_3/tugas7/jam.dart';
import 'package:ppkd_b_3/tugas7/switch.dart';
import 'package:ppkd_b_3/tugas7/tanggal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndexDrawer = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Checkbox1(),
    Tanggal(),
    Jam(),
    Center(child: Text("Halaman 3")),
    Switch1(),
    Switch1(),
  ];
  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("syarat dan ketentuan"),
              onTap: () {
                onItemTap(0);
              },
            ),

            ListTile(
              title: Text("Tanggal"),
              onTap: () {
                onItemTap(1);
              },
            ),
            ListTile(
              title: Text("Waktu"),
              onTap: () {
                onItemTap(2);
              },
            ),
            ListTile(
              title: Text("Pilih tanggal lahir"),
              onTap: () {
                onItemTap(3);
              },
            ),
            ListTile(
              title: Text("Atur pengingat"),
              onTap: () {
                onItemTap(4);
              },
            ),
            ListTile(
              title: Text("Switch"),
              onTap: () {
                onItemTap(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
