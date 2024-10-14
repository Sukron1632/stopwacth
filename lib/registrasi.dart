import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _Registrasi() async {
    String email = usernameController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushNamed(context, '/beranda');
    } on FirebaseAuthException catch (e) {
      String message = 'Sign up Failed';

      if (e.code == 'weak-password') {
        message = 'Password Telalu lemah';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email Sudah Digunakan';
      } else if (e.code == 'invalid-email') {
        message = 'Email invalid';
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign up Failed'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Registrasi",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _icon(),
            const SizedBox(height: 50),
            _inputField("Email", usernameController),
            const SizedBox(height: 10),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(height: 30),
            _loginBtn(), // Tombol Sign Up
            const SizedBox(height: 5),
            login(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      child: Image.asset('assets/images/stopwacth.jpeg', width: 120, height: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.black54),
    );

    return TextField(
      style: const TextStyle(color: Colors.black87),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        _Registrasi();
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black, 
        foregroundColor: Colors.white, 
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Registrasi",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget login() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: const Text(
        "Sudah memiliki Akun?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, color: Colors.black54),
      ),
    );
  }
}
