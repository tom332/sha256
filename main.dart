import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() => runApp(const MaterialApp(home: CryptoApp()));

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});
  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  String _hashResult = "Click the button below to calculate the hash";
  final TextEditingController _controller = TextEditingController();

  void _runSha256() {
    var bytes = utf8.encode(_controller.text); // Change to user input
    var digest = sha256.convert(bytes);
    
    setState(() {
      _hashResult = digest.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Satoshi Nakamoto Hash Experiment")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
              const SizedBox(height: 20),
              SelectableText(_hashResult,
                  style: const TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _runSha256,
                child: const Text("Start calculating SHA-256"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
