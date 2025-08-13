import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigator.dart';
import 'package:ppkd_b_3/tugas%209/list.dart';
import 'package:ppkd_b_3/tugas%209/map.dart';
import 'package:ppkd_b_3/tugas%209/model.dart';
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
    Day14ListOnListViewBuilder(),
    Map1(),
    Model1(),
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
                onItemTap(4);
              },
            ),
            ListTile(
              title: Text("List"),
              onTap: () {
                onItemTap(5);
              },
            ),
            ListTile(
              title: Text("List Map"),
              onTap: () {
                onItemTap(6);
              },
            ),
            ListTile(
              title: Text("Model"),
              onTap: () {
                onItemTap(7);
              },
            ),
          ],
        ),
      ),
    );
  }
}
