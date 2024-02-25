import 'package:bit_harvesting/features/selling_product/repository/selling_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSellScreen extends ConsumerStatefulWidget {
  const ProductSellScreen({super.key});

  @override
  ConsumerState<ProductSellScreen> createState() => _ProductSellScreenState();
}

class _ProductSellScreenState extends ConsumerState<ProductSellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
        title: const Text(
          'Your Sell Products',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(selling_list_provider).getList(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                "Loading...",
                style: TextStyle(color: Colors.green),
              ),
            );
          }
          List<Map<String, dynamic>> list = snapshot.data!;
          list = list +
              [
                {
                  'crop': 'Gehu',
                  'quantity': '60kg',
                  'exp': '12 dec 2024',
                  'image':
                      'https://5.imimg.com/data5/ST/QW/MY-38700875/fresh-wheat-crop-1000x1000.jpg',
                  'price': '74',
                },
                {
                  'crop': 'Soyabean',
                  'quantity': '20kg',
                  'exp': '23 fab 2027',
                  'image':
                      'https://qph.cf2.quoracdn.net/main-qimg-2cb005f6eac5b8c5151e4c21e1f48b6b-lq',
                  'price': '390',
                },
                {
                  'crop': 'Moong dal',
                  'quantity': '10kg',
                  'exp': '14 jan 2025',
                  'image':
                      'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2022/04/02115837/30.jpg',
                  'price': '40',
                },
              ];
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[index]['image'] ??
                        'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2022/04/02115837/30.jpg'),
                  ),
                  title: Text(list[index]['crop']),
                  subtitle: Text(
                    'Quantity : ${list[index]['quantity']} Price : ${list[index]['price']}',
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                    ),
                    child: const Text('Buy'),
                  ),
                );
              });
        },
      ),
    );
  }
}
