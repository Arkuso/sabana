import 'package:flutter/material.dart';
import 'login.dart';
import 'description.dart';

void main() {
  runApp(const SabanaApp());
}

class SabanaApp extends StatelessWidget {
  const SabanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayam Sabana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange[700],
          secondary: Colors.orangeAccent,
        ),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class SabanaMenuItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  SabanaMenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class SabanaMenuPage extends StatelessWidget {
  const SabanaMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menu items data
    final List<SabanaMenuItem> menuItems = [
      SabanaMenuItem(
        name: 'Ayam Saus Keju',
        description: 'Ayam goreng renyah dengan saus keju spesial',
        price: 25000,
        imagePath: 'images/AyamSausKeju.jpg',
      ),
      SabanaMenuItem(
        name: 'Sayap Buldak',
        description: 'Sayap ayam pedas ala Korea dengan saus buldak',
        price: 22000,
        imagePath: 'images/SayapBuldak.jpg',
      ),
      SabanaMenuItem(
        name: 'Tusuk Chicken',
        description: 'Tusuk ayam goreng renyah dengan saus keju spesial',
        price: 13000,
        imagePath: 'images/TusukChicken.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Ayam Sabana',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              // Navigate to the description page
              final detailedItem = MenuItemDetails.fromBasicMenuItem(
                name: item.name,
                description: item.description,
                price: item.price,
                imagePath: item.imagePath,
              );
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChickenDescriptionPage(
                    menuItem: detailedItem,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.white,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.error, size: 50, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rp ${item.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
