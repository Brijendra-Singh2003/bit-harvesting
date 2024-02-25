import 'package:bit_harvesting/features/auth/screens/my_home_page.dart';
import 'package:bit_harvesting/features/selling_product/screens/product_sell_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green.shade400,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                'Product Detail',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyHomePage(),
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProductSellScreen(),
                  ),
                );
              },
              leading: const Icon(Icons.sell_outlined),
              title: const Text(
                "Sell You Product",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.admin_panel_settings_outlined),
              title: const Text(
                "Admin Panel",
              ),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
