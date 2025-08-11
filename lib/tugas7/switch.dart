import 'package:flutter/material.dart';

class Switch1 extends StatefulWidget {
  const Switch1({super.key});

  @override
  State<Switch1> createState() => _Switch1State();
}

class _Switch1State extends State<Switch1> {
  bool isCheckedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isCheckedSwitch ? Colors.black : Colors.white,
      body: Column(
        children: [
          Text(
            "aktifkan mode gelap",
            style: TextStyle(
              color: isCheckedSwitch == true ? Colors.white : Colors.black,
            ),
          ),
          Row(
            children: [
              Switch(
                activeColor: Colors.red,
                value: isCheckedSwitch,
                onChanged: (value) {
                  setState(() {
                    isCheckedSwitch = value;
                  });
                },
              ),
              Text(
                isCheckedSwitch == true
                    ? "mode gelap aktif"
                    : "mode terang aktif",
                style: TextStyle(
                  color: isCheckedSwitch == true ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
