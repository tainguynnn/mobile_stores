import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest/widgets/dialog_helper.dart';
import 'dart:convert';

import '../../constant/constant.dart';
import '../../widgets/text_fields/password_fields.dart';
import '../../widgets/text_fields/text_fields.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controllers
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final passwordConfirm = _passwordConfirmController.text;

    if (passwordConfirm == password) {
      try {
        final response = await http.post(
          Uri.parse('$baseUrl/users/register'),
          // Replace with your API URL
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
          },
          body: json.encode({
            'name': name,
            'username': username,
            'password': password,
          }),
        );

        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          if (response.statusCode == 200) {
            // Registration successful, navigate to login page
            widget.showLoginPage();
          } else if (response.statusCode == 400) {
            // Registration successful, navigate to login page
            DialogHelper.showErrorDialog(context, response.body);
          } else {
            DialogHelper.showErrorDialog(
                context, 'Registration failed. Please try again.');
          }
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          DialogHelper.showErrorDialog(
              context, 'An error occurred. Please try again.');
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      DialogHelper.showErrorDialog(
          context, 'password and confirm password are not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_shopping_cart, size: 70),
                const SizedBox(height: 25),
                const SizedBox(height: 8),
                const Text(
                  "Register below",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 50),
                TextFields(
                  controller: _nameController,
                  hint: 'Name',
                ),
                const SizedBox(height: 10),
                TextFields(
                  controller: _usernameController,
                  hint: 'Username',
                ),
                const SizedBox(height: 10),
                PasswordFields(
                  controller: _passwordController,
                  hint: 'Password',
                ),
                const SizedBox(height: 10),
                PasswordFields(
                  controller: _passwordConfirmController,
                  hint: 'Confirm password',
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: _isLoading ? null : _register,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?'),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
