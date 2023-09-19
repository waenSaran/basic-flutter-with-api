import 'package:basicflutter/model/user.dart';
import 'package:basicflutter/services/userApi.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final pic = user.picture;
            return ListTile(
              leading:
                  CircleAvatar(backgroundImage: NetworkImage(pic.thumbnail)),
              title: Text(user.fullName),
              subtitle: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers, child: const Icon(Icons.refresh)),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi().fetchUsers();
    setState(() {
      users = response;
    });
  }
}
