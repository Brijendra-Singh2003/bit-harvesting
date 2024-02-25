import 'package:bit_harvesting/constant/data_set.dart';
import 'package:flutter/material.dart';

class WheatListTile extends StatelessWidget {
  const WheatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text('Seeds'),
      ),
      body: ListView.builder(
          itemCount: DataSet.seeds.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> singleValue = DataSet.seeds[index];
            return ListTile(
              trailing: SizedBox(
                height: 40,
                child: Column(
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      singleValue['quantity'].toString(),
                      style: const TextStyle(
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
                    singleValue['image'],
                  ),
                ),
              ),
              title: Text(singleValue['name']),
              subtitle: Text(
                'Exp Dt : ${singleValue['exp']}',
              ),
            );
          }),
    );
  }
}
