import 'package:flutter/material.dart';

class Checkbox1 extends StatefulWidget {
  const Checkbox1({super.key});

  @override
  State<Checkbox1> createState() => _Checkbox1State();
}

class _Checkbox1State extends State<Checkbox1> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("saya meyetujui syarat dan ketentuan yang berlaku"),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
              Text(
                isCheck == true
                    ? "lanjutkan pendaftaran di bolehkan"
                    : "anda belum bisa melanjutkan pendaftaran",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
