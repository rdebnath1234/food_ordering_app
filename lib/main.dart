import 'package:flutter/material.dart';

void main() {
  runApp(FoodOrderingApp());
}

class FoodOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"name": "Burger", "price": "\$5.99"},
    {"name": "Pizza", "price": "\$7.99"},
    {"name": "Pasta", "price": "\$6.99"},
    {"name": "Salad", "price": "\$4.99"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menuItems[index]['name']!),
            subtitle: Text(menuItems[index]['price']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(
                    name: menuItems[index]['name']!,
                    price: menuItems[index]['price']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final String name;
  final String price;

  ItemDetailScreen({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Placeholder for order functionality
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added $name to cart!'),
                ));
              },
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
