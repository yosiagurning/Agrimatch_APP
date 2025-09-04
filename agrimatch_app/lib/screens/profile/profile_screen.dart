import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8FBC8F), // Light green
              Color(0xFF228B22), // Forest green
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with logo and title
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Logo
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF228B22),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/logo.png', // Ganti dengan path logo Anda
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                          color: Colors.white, // Optional: untuk memberikan tint putih pada logo
                          colorBlendMode: BlendMode.srcIn, // Optional: untuk menerapkan tint
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Profil Saya',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Profile content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Profile picture section
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8FBC8F).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF228B22),
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Color(0xFF228B22),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'User AgriMatch',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E7D32),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Profile information cards
                        Expanded(
                          child: ListView(
                            children: [
                              _buildProfileCard(
                                icon: Icons.person_outline,
                                title: 'Nama Lengkap',
                                subtitle: 'User AgriMatch',
                              ),
                              const SizedBox(height: 16),
                              _buildProfileCard(
                                icon: Icons.email_outlined,
                                title: 'Email',
                                subtitle: 'user@example.com',
                              ),
                              const SizedBox(height: 16),
                              _buildProfileCard(
                                icon: Icons.phone_outlined,
                                title: 'Nomor Telepon',
                                subtitle: '+62 812 3456 7890',
                              ),
                              const SizedBox(height: 16),
                              _buildProfileCard(
                                icon: Icons.location_on_outlined,
                                title: 'Lokasi',
                                subtitle: 'Jakarta, Indonesia',
                              ),
                              const SizedBox(height: 32),
                              
                              // Logout button
                              Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFFF6B6B), Color(0xFFE53E3E)],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFFF6B6B).withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                    context, 
                                    '/login', 
                                    (r) => false
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Keluar',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: const Color(0xFF8FBC8F).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF8FBC8F).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF228B22),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
