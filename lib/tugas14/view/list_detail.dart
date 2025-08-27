import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas14/model/user_model.dart';

class ListDetail extends StatelessWidget {
  final GetUserModel getUserModel;
  const ListDetail({super.key, required this.getUserModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(getUserModel.image ?? ""),
            Text(getUserModel.name ?? ""),
          ],
        ),
      ),
    );
  }
}
