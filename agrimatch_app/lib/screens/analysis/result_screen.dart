import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/soil_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final soil = context.watch<SoilProvider>();
    final r = soil.lastResult;
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Analisis')),
      body: r == null
          ? const Center(child: Text('Belum ada hasil.'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Lahan: ${r.landName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Jenis Tanah: ${r.predictedSoilType}'),
                  Text('Tanaman Rekomendasi: ${r.recommendedCrop}'),
                  Text('Skor Kesesuaian: ${r.recommendationScore}'),
                  const SizedBox(height: 12),
                  const Text('Detail:'),
                  Text(r.details.toString()),
                  const Spacer(),
                  ElevatedButton(onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/dashboard')), child: const Text('Selesai'))
                ],
              ),
            ),
    );
  }
}
