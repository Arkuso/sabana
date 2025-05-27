import 'package:flutter/material.dart';

// Model for a more detailed description of menu items
class MenuItemDetails {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final List<String> ingredients;
  final String cookingTime;
  final String spicyLevel;
  final String calories;

  MenuItemDetails({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.ingredients,
    required this.cookingTime,
    required this.spicyLevel,
    required this.calories,
  });

  // Create detailed menu items from the basic ones
  static MenuItemDetails fromBasicMenuItem({
    required String name,
    required String description,
    required double price,
    required String imagePath,
  }) {
    // Default details based on the item name
    List<String> ingredients = [];
    String cookingTime = "15-20 menit";
    String spicyLevel = "Sedang";
    String calories = "300-350 kkal";

    if (name.contains('Ayam Saus Keju')) {
      ingredients = [
        'Dada ayam fillet',
        'Tepung roti',
        'Keju cheddar',
        'Saus keju spesial',
        'Bawang putih',
        'Bawang bombay',
        'Mayonaise',
        'Rempah rahasia',
      ];
      spicyLevel = "Rendah";
      calories = "380 kkal";
    } else if (name.contains('Sayap Buldak')) {
      ingredients = [
        'Sayap ayam',
        'Saus buldak Korea',
        'Cabai merah',
        'Bawang putih',
        'Madu',
        'Kecap asin',
        'Minyak wijen',
        'Wijen',
      ];
      cookingTime = "20-25 menit";
      spicyLevel = "Pedas";
      calories = "320 kkal";
    } else if (name.contains('Tusuk Chicken')) {
      ingredients = [
        'Daging ayam fillet',
        'Tepung roti spesial',
        'Bumbu rahasia',
        'Saus keju',
        'Mayonaise',
        'Daun selada',
        'Tomat',
        'Mentimun',
      ];
      cookingTime = "10-15 menit";
      spicyLevel = "Rendah";
      calories = "290 kkal";
    }

    return MenuItemDetails(
      name: name,
      description: description,
      price: price,
      imagePath: imagePath,
      ingredients: ingredients,
      cookingTime: cookingTime,
      spicyLevel: spicyLevel,
      calories: calories,
    );
  }
}

class ChickenDescriptionPage extends StatelessWidget {
  final MenuItemDetails menuItem;

  const ChickenDescriptionPage({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.name),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                menuItem.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            
            // Price and name card
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Rp ${menuItem.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Quick info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(
                    context, 
                    Icons.timer, 
                    'Waktu Masak', 
                    menuItem.cookingTime,
                  ),
                  _buildInfoItem(
                    context, 
                    Icons.local_fire_department, 
                    'Level Pedas', 
                    menuItem.spicyLevel,
                  ),
                  _buildInfoItem(
                    context, 
                    Icons.fastfood, 
                    'Kalori', 
                    menuItem.calories,
                  ),
                ],
              ),
            ),
            
            // Description
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    menuItem.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Ingredients
                  const Text(
                    'Bahan-Bahan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: menuItem.ingredients.map((ingredient) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              ingredient,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  
                  // Extra information
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilihan Terbaik',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Menu ini adalah salah satu pilihan terbaik dari Ayam Sabana. '
                          'Dibuat dengan bahan-bahan berkualitas tinggi dan diolah oleh chef berpengalaman.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Order button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // Order functionality would go here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pesanan ditambahkan ke keranjang!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, 
    IconData icon, 
    String title, 
    String value,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
