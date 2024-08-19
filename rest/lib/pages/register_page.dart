import 'package:flutter/material.dart';

import '../widgets/text_fields/text_fields.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

    super.dispose();
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

                TextFields(controller: _nameController, hint: 'Name'),
                const SizedBox(height: 10),

                TextFields(controller: _usernameController, hint: 'Username'),
                const SizedBox(height: 10),

                TextFields(controller: _passwordController, hint: 'Password'),
                const SizedBox(height: 10),

                const SizedBox(height: 12),
                //Sign In button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Not a member? Join now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?'),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
