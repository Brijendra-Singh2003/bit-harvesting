import 'package:bit_harvesting/constant/auth_field_widget.dart';
import 'package:bit_harvesting/features/selling_product/repository/selling_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConformationScreen extends ConsumerStatefulWidget {
  final String name;
  final String url;
  const ConformationScreen({super.key, required this.name,required this.url});

  @override
  ConsumerState<ConformationScreen> createState() => _ConformationScreenState();
}

class _ConformationScreenState extends ConsumerState<ConformationScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Conformation Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
               CircleAvatar(
                radius: 128,
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                widget.url   ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 33),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  'Current Market Price : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2000rs per qtl',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextField(
                controller: _controller,
                onChange: (val) {},
                hintText: 'Set Quantity want to sell',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Added Successfully',
                      ),
                    ),
                  );
                  Navigator.pop(context);
                  ref.read(selling_list_provider).uploadList({
                    'qty': _controller.text,
                    'price': '2000',
                    'crop': widget.name,
                  });
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
