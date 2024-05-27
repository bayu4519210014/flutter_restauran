import 'package:flutter/material.dart';
import 'food_menu.dart';
import 'cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FoodMenu> cartItems = [];

  void _addToCart(FoodMenu foodMenu) {
    setState(() {
      cartItems.add(foodMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat datang di Praktikum Flutter!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              child: const Text('Menu'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<CartItem> _cartItems = [];

  void addToCart(FoodMenu foodMenu) {
    setState(() {
      _cartItems.add(CartItem(foodMenu: foodMenu, quantity: 1));
    });
  }

  List<FoodMenu> foodMenus = [
    FoodMenu(
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2022/03/13/resep-ayam-goreng-jawa_43.jpeg?w=600&q=90',
        name: 'Aaym Goreng',
        price: 45000),
    FoodMenu(
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2022/04/20/resep-gurame-bakar-bumbu-kecap-cabe_43.jpeg?w=1200',
        name: 'Ikan Bakar',
        price: 55000),
    FoodMenu(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5FfYowXUwaoMLwUzmlBC42xpXvAqxelB4veNSp2ymqQ&s',
        name: 'Chicken Katsu',
        price: 135000),
    FoodMenu(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAOFAnwGi6K6gF5O9ltqB3whTihGSPOJ1gwuUr7VE0XA&s',
        name: 'Pizza',
        price: 105000),
    FoodMenu(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMKvaKDj1u7X_UMt33p2niDQxBPLruFc7aWmJBpJxFiA&s',
        name: 'Pastry',
        price: 71000),
    FoodMenu(
        imageUrl:
            'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/dessert-main-image-molten-cake-0fbd4f2.jpg',
        name: 'Choco Lava ',
        price: 99000),
    FoodMenu(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD9qggp9RKmPpxla9InLPvdP7gzWzzjhgQl-2Ue8kyDA&s',
        name: 'Ice Cream ',
        price: 45000),
    FoodMenu(
        imageUrl:
            'https://images.unsplash.com/photo-1555196301-9acc011dfde4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        name: 'Gyros with Tzatziki',
        price: 75000),
    FoodMenu(
        imageUrl:
            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        name: 'Pizza with cheezy mushroom',
        price: 85000),
    FoodMenu(
        imageUrl:
            'https://images.unsplash.com/photo-1624371414361-e670edf4898d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        name: 'Churros',
        price: 45000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartDialog(cartItems: _cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: foodMenus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(
                    foodMenu: foodMenus[index],
                    addToCart: addToCart,
                    cartItems: _cartItems,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      foodMenus[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      foodMenus[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Rp ${foodMenus[index].price.toStringAsFixed(0)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String restaurantExteriorUrl =
        'https://akcdn.detik.net.id/community/media/visual/2022/04/27/ilustrasi-restoran-1_169.jpeg?w=700&q=90';

    const String restaurantMapUrl =
        'https://www.google.com/maps/place/Eiffel+Tower/';

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'About Restaurant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.network(restaurantExteriorUrl),
            const SizedBox(height: 20),
            const Text(
              'Our restaurant offers a variety of delicious foods made from the finest ingredients. Our chefs are experts in their field and are dedicated to providing the best dining experience.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(restaurantMapUrl)) {
                  await launch(restaurantMapUrl);
                } else {
                  throw 'Could not launch $restaurantMapUrl';
                }
              },
              child: const Text('Find us on the map'),
            ),
          ],
        ),
      ),
    );
  }

  canLaunch(String restaurantMapUrl) {}
}

launch(String restaurantMapUrl) {}

class FoodDetailPage extends StatelessWidget {
  final FoodMenu foodMenu;
  final Function(FoodMenu) addToCart;
  final List<CartItem> cartItems;

  const FoodDetailPage({
    super.key,
    required this.foodMenu,
    required this.addToCart,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodMenu.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartDialog(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(foodMenu.imageUrl),
            const SizedBox(height: 20),
            Text(
              foodMenu.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Rp ${foodMenu.price.toStringAsFixed(0)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToCart(foodMenu);
                Navigator.pop(context);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartDialog extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartDialog({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartItems[index].foodMenu.imageUrl),
            title: Text(cartItems[index].foodMenu.name),
            subtitle: Text(
                'Rp ${cartItems[index].foodMenu.price.toStringAsFixed(0)} x ${cartItems[index].quantity}'),
            trailing: Text(
                'Rp ${(cartItems[index].foodMenu.price * cartItems[index].quantity).toStringAsFixed(0)}'),
          );
        },
      ),
    );
  }
}
