import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latihan_firebase1/anggota.dart';
import 'package:latihan_firebase1/bantuan.dart';
import 'package:latihan_firebase1/beranda.dart';
import 'package:latihan_firebase1/registrasi.dart';
import 'firebase_options.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Registrasi(),
        '/beranda': (context) => const Beranda(),
        '/bantuan': (context) => const Bantuan(),
        '/anggota': (context) =>  Anggota(),
      },
    );
  }
}
