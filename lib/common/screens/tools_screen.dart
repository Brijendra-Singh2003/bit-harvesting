import 'package:bit_harvesting/main.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

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
                  child:  CardWidget(
                    name: "Hands Tools",
                    icon: Icons.settings,
                  ),
                ),
                const CardWidget(name: "Machines",icon: Icons.account_tree_outlined,),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget(
                  icon: Icons.home_repair_service_rounded,
                  name: "Attachment\nTool  ",
                ),
                CardWidget(
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
