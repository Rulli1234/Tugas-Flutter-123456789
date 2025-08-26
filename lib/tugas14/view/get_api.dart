import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas14/api/get_user.dart';
import 'package:ppkd_b_3/tugas14/model/user_model.dart';

class Day23GetAPIScreen extends StatefulWidget {
  const Day23GetAPIScreen({super.key});
  static const id = "/get_api_screen";

  @override
  State<Day23GetAPIScreen> createState() => _Day23GetAPIScreenState();
}

class _Day23GetAPIScreenState extends State<Day23GetAPIScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<GetUserModel>>(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final users = snapshot.data as List<GetUserModel>;
                  print(users);

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dataUser = users[index];
                      return ListTile(
                        leading: Image.network(dataUser.id ?? ""),
                        title: Text(dataUser.id ?? ""),
                        subtitle: Text(
                          "${dataUser.name} ${dataUser.hashCode}" ?? '',
                        ),
                      );
                    },
                  );
                } else {
                  return Text("Gagal Memuat data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// mixin UserModel {
//   get avatar => null;

//   get firstName => null;
// }
