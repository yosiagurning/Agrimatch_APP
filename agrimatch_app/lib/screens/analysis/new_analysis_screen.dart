import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/soil_provider.dart';

class NewAnalysisScreen extends StatefulWidget {
  const NewAnalysisScreen({super.key});
  @override
  State<NewAnalysisScreen> createState() => _NewAnalysisScreenState();
}

class _NewAnalysisScreenState extends State<NewAnalysisScreen> {
  final _landName = TextEditingController();
  File? _img;
  final _picker = ImagePicker();

  Future<void> _pick(ImageSource src) async {
    final x = await _picker.pickImage(source: src, imageQuality: 85);
    if (x != null) setState(() => _img = File(x.path));
  }

  @override
  Widget build(BuildContext context) {
    final soil = context.watch<SoilProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Analisis Tanah Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _landName, decoration: const InputDecoration(labelText: 'Nama Lahan')),
            const SizedBox(height: 12),
            _img == null ? Container(height: 200, color: Colors.black12, child: const Center(child: Text('Belum ada foto'))) : Image.file(_img!, height: 200),
            const SizedBox(height: 12),
            Row(children: [
              ElevatedButton.icon(onPressed: () => _pick(ImageSource.camera), icon: const Icon(Icons.camera_alt), label: const Text('Kamera')),
              const SizedBox(width: 12),
              ElevatedButton.icon(onPressed: () => _pick(ImageSource.gallery), icon: const Icon(Icons.photo), label: const Text('Galeri')),
            ]),
            const Spacer(),
            soil.loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (_img == null) return;
                      try {
                        await soil.analyze(_img!, {
                          'land_name': _landName.text,
                          'location': 'unknown',
                          'altitude': '0',
                          'water_availability': 'cukup',
                          'climate_type': 'tropis',
                          'drainage': 'baik',
                        });
                        if (mounted) Navigator.pushNamed(context, '/analysis/result');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal: $e')));
                      }
                    },
                    child: const Text('Analisis'),
                  ),
          ],
        ),
      ),
    );
  }
}
