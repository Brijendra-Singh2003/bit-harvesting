import 'package:flutter/material.dart';

class WheatListTile extends StatelessWidget {
  const WheatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bit Harvesting'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const ListTile(
              trailing: SizedBox(
                height: 40,
                child: Column(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '80kg',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              leading: CircleAvatar(
                child: Image(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-photo/wheat-grain-bag_54391-136.jpg?size=626&ext=jpg',
                  ),
                ),
              ),
              title: Text('Wheat'),
              subtitle: Text(
                'Exp Dt : 24-july',
              ),
            );
          }),
    );
  }
}
