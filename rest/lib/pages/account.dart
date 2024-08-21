import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest/pages/auth/auth_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rest/widgets/screen_title/page_title.dart';
import 'package:rest/models/user.dart';

import '../constant/constant.dart';
import '../widgets/product_detail/account_attribute.dart';

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
      Uri.parse('$baseUrl/v2/users/auth/me'),
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

  void _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken'); // Clear the stored token

    // Navigate to the login screen and remove all previous routes
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthPage()),
      (route) => false,
    );
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
              const SizedBox(height: 20),
              AccountAttribute(title: 'Name', detail: user.name),
              AccountAttribute(title: 'Username', detail: user.username),
              AccountAttribute(title: 'Role', detail: user.role),
              const SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(240, 173, 78, 1),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Set the border radius
                  ),
                  // Set the button to be square (60x60)
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical:
                          10), // Remove padding to make it a perfect square
                ),
                onPressed: _logOut,
                child: const Text('Log out'),
              ),
            ],
          );
        }
      },
    );
  }
}
