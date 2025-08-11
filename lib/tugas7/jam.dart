import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_b_3/tugas7/main_screen.dart';

class Jam extends StatefulWidget {
  const Jam({super.key});

  @override
  State<Jam> createState() => _JamState();
}

class _JamState extends State<Jam> {
  TimeOfDay? selectedTime;

  // Fungsi untuk membuat formatter
  DateFormat _debugLifecycleState(String pattern, String locale) {
    return DateFormat(pattern, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Tanggal Lahir"),
        backgroundColor: Colors.blue,
      ),
      drawer: const MainScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time Picker"),
            ElevatedButton(
              child: Text("Pilih Jam"),
              onPressed: () async {
                final TimeOfDay? pickerDate = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  // firstDate: DateTime(2000),
                  // lastDate: DateTime(2100),
                );
                if (pickerDate != null) {
                  setState(() {});
                  selectedTime = pickerDate;
                }
              },
            ),
            Text(
              selectedTime == null
                  ? "Pilih jam dulu"
                  : "${selectedTime!.hour.toString()} : ${selectedTime!.minute.toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
