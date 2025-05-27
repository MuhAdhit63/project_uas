import 'package:flutter/material.dart';
import 'profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      buildHomeScreen(),
      const Placeholder(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _pages[_currentIndex],
      ),
    );
  }

  Widget buildHomeScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/images/banner.jpg'),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 50,
                    child: Column(
                      // spacing: 15.0,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 100,
                  left: 16,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text('Cepi Mulyadi'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.sports_baseball, size: 48.0),
                    Text('sports'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_balance, size: 48.0),
                    Text('politic'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.star, size: 48.0), Text('selebriti')],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.gavel, size: 48.0), Text('criminal')],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.grid_view, size: 48.0), Text('Menu')],
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'see more >>',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            articleCard(
              'Pasokan Energi Lancar, Posko Nasional Sektor ESDM 2025 Resmi Ditutup',
              'assets/images/download.jpg',
            ),
            articleCard(
              'Pemerintah Umumkan Kebijakan Baru di Sektor Pendidikan',
              'assets/images/liburan.jpg',
            ),
            articleCard(
              'Indonesia Raih Medali Emas di Olimpiade 2025',
              'assets/images/emas.jpg',
            ),
            articleCard(
              'Festival Film Nasional 2025 Resmi Dibuka di Jakarta',
              'assets/images/film.jpg',
            ),
            articleCard(
              'Partai Politik Mulai Siapkan Strategi untuk Pemilu 2029',
              'assets/images/partai.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget articleCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4),
              ],
            ),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryIcon(String? assetPath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child:
          assetPath != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(assetPath, fit: BoxFit.cover),
              )
              : const SizedBox.shrink(),
    );
  }
}
