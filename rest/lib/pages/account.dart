import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rest/widgets/screen_title/page_title.dart';
import 'package:rest/models/user.dart';

import '../widgets/product_detail/detail_attribute.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future<User?> _fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/v2/users/auth/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      // Handle error response
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        } else {
          final user = snapshot.data!;
          return Column(
            children: [
              const PageTitle(title: 'Account'),
              const SizedBox(
                height: 20,
              ),
              DetailAttribute(title: 'Name', detail: user.name),
              DetailAttribute(title: 'Username', detail: user.username),
              DetailAttribute(title: 'Role', detail: user.role),
            ],
          );
        }
      },
    );
  }
}
