import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigator.dart';
import 'package:ppkd_b_3/tugas14/api/get_user.dart';
import 'package:ppkd_b_3/tugas14/model/user_model.dart';
import 'package:ppkd_b_3/tugas14/view/list_detail.dart';

class Day23GetAPIScreen extends StatefulWidget {
  const Day23GetAPIScreen({super.key});
  static const id = "/get_api_screen";

  @override
  State<Day23GetAPIScreen> createState() => _Day23GetAPIScreenState();
}

class _Day23GetAPIScreenState extends State<Day23GetAPIScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Welcome> _allUsers = [];
  List<Welcome> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _loadUsers() async {
    final users = await getUser();
    setState(() {
      _allUsers = users;
      _filteredUsers = users;
    });
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _allUsers.where((user) {
        final name = user.name?.toLowerCase() ?? "";
        final id = user.id?.toLowerCase() ?? "";
        return name.contains(query) || id.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get API with Search")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Welcome>>(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final characters = snapshot.data as List<Welcome>;
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dataCharacter = characters[index];
                      return Card(
                        color: Colors.blue.shade100,
                        child: ListTile(
                          onTap: () {
                            context.push(DetailScreen(anime: dataCharacter));
                          },
                          leading: Image.network(
                            dataCharacter.image ?? "",
                            errorBuilder: (context, error, stackTrace) {
                              return CircleAvatar();
                            },
                          ),
                          title: Text(dataCharacter.name ?? ""),
                          subtitle: Text(
                            "${dataCharacter.currentPrice} " ?? "",
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text("Gagal memuat data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
