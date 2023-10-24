import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  _ContactList createState() => _ContactList();
}

class _ContactList extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Lista de contatos",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true),
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    ));
  }
}
