import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static String route() => '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
