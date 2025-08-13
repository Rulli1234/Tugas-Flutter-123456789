import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas10/homea.dart';
import 'package:ppkd_b_3/tugas7/main_screen.dart';
import 'package:ppkd_b_3/tugas8/tentang.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});
  static const id = "/task";

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    AboutAppPage(),
    Day15ParsingData(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Form'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
