import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Analisis')),
      body: const Center(child: Text('Sinkronisasi & penyimpanan lokal akan ditambahkan (sqflite).')),
    );
  }
}
