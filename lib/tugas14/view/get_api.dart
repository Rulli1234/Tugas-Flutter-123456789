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
  List<GetUserModel> _allUsers = [];
  List<GetUserModel> _filteredUsers = [];

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
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Cari user berdasarkan nama atau id...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _allUsers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _filteredUsers.isEmpty
                ? const Center(child: Text("Tidak ada hasil"))
                : ListView.builder(
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      final dataUser = _filteredUsers[index];
                      return ListTile(
                        onTap: () {
                          context.push(ListDetail(getUserModel: dataUser));
                        },
                        leading: Image.network(dataUser.image ?? ""),
                        title: Text(dataUser.name ?? "-"),
                        subtitle: Text(dataUser.id ?? "-"),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
