import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_b_3/tugas7/main_screen.dart';

class Tanggal extends StatefulWidget {
  const Tanggal({super.key});

  @override
  State<Tanggal> createState() => _DatepickerState();
}

class _DatepickerState extends State<Tanggal> {
  DateTime? selectedDate;

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
            Text("Date Picker"),
            ElevatedButton(
              child: Text("Pilih Tanggal"),
              onPressed: () async {
                final DateTime? pickerDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickerDate != null) {
                  setState(() {});
                  selectedDate = pickerDate;
                }
              },
            ),
            Text(selectedDate.toString()),
            Text(
              selectedDate == null
                  ? "Pilih tanggal dulu"
                  : DateFormat('EEEE').format(selectedDate!),
            ),
            Text(
              selectedDate == null
                  ? "Pilih tanggal dulu"
                  : DateFormat('yyyy').format(selectedDate!),
            ),
            Text(
              selectedDate == null
                  ? "Pilih tanggal dulu"
                  : DateFormat('MMM').format(selectedDate!),
            ),
            Text(
              selectedDate == null
                  ? "Pilih tanggal dulu"
                  : DateFormat(
                      'EEEE, dd MMMM yyyy',
                      "id_ID",
                    ).format(selectedDate!),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
