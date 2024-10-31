import 'package:flutter/material.dart';

class UniformPage extends StatefulWidget {
  const UniformPage({super.key});

  @override
  State<UniformPage> createState() => _UniformPageState();
}

class _UniformPageState extends State<UniformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Uniform Page"),
      ),
    );
  }
}
