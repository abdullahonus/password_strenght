import 'package:flutter/material.dart';
import 'package:password_strenght_c4/main_screen.dart';

void main() => runApp(const MyApp());

////////////////////////////////////////////
///follow For more ig: @Countrol4offical
///@countrolfour@gmail.com
////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Password Strenght',
        home: PasswordStrenght());
  }
}
