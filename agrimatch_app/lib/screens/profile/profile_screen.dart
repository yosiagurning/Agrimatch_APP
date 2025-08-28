import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        children: [
          const ListTile(title: Text('Nama'), subtitle: Text('User AgriMatch')),
          const ListTile(title: Text('Email'), subtitle: Text('user@example.com')),
          ListTile(
            title: const Text('Keluar'),
            leading: const Icon(Icons.logout),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false),
          )
        ],
      ),
    );
  }
}
