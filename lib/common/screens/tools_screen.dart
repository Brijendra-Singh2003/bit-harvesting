import 'package:bit_harvesting/constant/data_set.dart';
import 'package:bit_harvesting/features/selling_product/screens/conformation_screen.dart';
import 'package:bit_harvesting/main.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Equipements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HandTool(),
                      ),
                    );
                  },
                  child: const CardWidget(
                    name: "Hands Tools",
                    icon: Icons.settings,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MachineTool(),
                      ),
                    );
                  },
                  child: const CardWidget(
                    name: "Machines",
                    icon: Icons.account_tree_outlined,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AttachmentsTools(),
                      ),
                    );
                  },
                  child: const CardWidget(
                    icon: Icons.home_repair_service_rounded,
                    name: "Attachments",
                  ),
                ),
                const CardWidget(
                  icon: Icons.create_new_folder,
                  name: "Others",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HandTool extends StatelessWidget {
  const HandTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Hand Tools',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Hoe'),
            trailing: Text('Qty : 5'),
          ),
          ListTile(
            title: Text('Wheelbarrow'),
            trailing: Text('Qty : 3'),
          ),
          ListTile(
            title: Text('Sickle'),
            trailing: Text('Qty : 7'),
          ),
          ListTile(
            title: Text('Gardenfork'),
            trailing: Text('Qty : 4'),
          ),
          ListTile(
            title: Text('Hand cultivator'),
            trailing: Text('Qty : 1'),
          ),
        ],
      ),
    );
  }
}

class MachineTool extends StatelessWidget {
  const MachineTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Machines',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Harvester'),
            trailing: Text('Qty : 1'),
          ),
          ListTile(
            title: Text('Crop cutter'),
            trailing: Text('Qty : 3'),
          ),
          ListTile(
            title: Text('Sprayer'),
            trailing: Text('Qty : 7'),
          ),
        ],
      ),
    );
  }
}

class FertilzerTool extends StatelessWidget {
  const FertilzerTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Fertilizers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 130),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InorganicList(),
                  ),
                );
              },
              child: const CardWidget(
                icon: Icons.favorite,
                name: "InOrganic",
              ),
            ),
            GestureDetector(
              child: const CardWidget(
                icon: Icons.settings,
                name: "Organic",
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrganicList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InorganicList extends StatelessWidget {
  const InorganicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Bit Harvesting',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Phosphorous'),
            trailing: Text('Qty : 30kg'),
            subtitle: Text('Govn. Sub'),
          ),
          ListTile(
            title: Text('Potassium'),
            trailing: Text('Qty : 30kg'),
            subtitle: Text('Govn. Sub'),
          ),
          ListTile(
            title: Text('Ammonia'),
            trailing: Text('Qty : 30kg'),
            subtitle: Text('Govn. Sub'),
          ),
        ],
      ),
    );
  }
}

class OrganicList extends StatelessWidget {
  const OrganicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Bit Harvesting',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Compost'),
            trailing: Text('Qty : 50kg'),
          ),
          ListTile(
            title: Text('Cattle Manures'),
            trailing: Text('Qty : 10kg'),
          ),
          ListTile(
            title: Text('Domestic Sewage'),
            trailing: Text('Qty : 13kg'),
          ),
        ],
      ),
    );
  }
}

class CropPortfolio extends StatelessWidget {
  const CropPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green.shade600,
          centerTitle: true,
          title: const Text(
            'Crop Collection',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: DataSet.seeds.length,
            itemBuilder: (context, index) {
              var value = DataSet.seeds[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(value['image']!),
                ),
                title: Text(
                  value['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Text('Qty : ${value['quantity']}'),
                trailing: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConformationScreen(
                          name: value['name']!,
                          url: value['image']!,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Sell',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }));
  }
}

class AttachmentsTools extends StatelessWidget {
  const AttachmentsTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Attachments',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text(
              'Cultivator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            trailing: Text('Qty : 1'),
          ),
          ListTile(
            title: Text(
              'Rotavator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            trailing: Text('Qty : 2'),
          ),
          ListTile(
            title: Text(
              'weeder',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            trailing: Text('Qty : 3'),
          ),
        ],
      ),
    );
  }
}


/*
ListView(
        children: [
          ListTile(
            title: const Text(
              'Wheat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            subtitle: const Text('Qty : 30qtl'),
            trailing: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConformationScreen(),
                  ),
                );
              },
              child: const Text(
                'Sell',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Maize',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            subtitle: const Text('Qty : 38qtl'),
            trailing: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConformationScreen(),
                  ),
                );
              },
              child: const Text(
                'Sell',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Rice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            subtitle: const Text('Qty : 34qtl'),
            trailing: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConformationScreen(),
                  ),
                );
              },
              child: const Text(
                'Sell',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
  
*/