import 'package:bit_harvesting/common/screens/home_screen_drawer.dart';
import 'package:bit_harvesting/common/screens/tools_screen.dart';
import 'package:bit_harvesting/constant/wheat_list_tile.dart';
import 'package:bit_harvesting/features/chat_bot/screens/bot_chat_screen.dart';
import 'package:bit_harvesting/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://img.freepik.com/free-photo/woman-picking-tea-leaves-by-hand-green-tea-farm_335224-771.jpg?w=996&t=st=1708817909~exp=1708818509~hmac=936d4347e9451fbff8167dffb8961c3f2d91555b15b6aefc9c4915f056805339',
    'https://i.ibb.co/BNyrDN5/76a863a9-a2e8-4463-8b6b-b0bce86b2d26.jpg',
        'https://img.freepik.com/free-photo/young-woman-harvesting-strawberries-greenhouse_7502-8029.jpg?size=626&ext=jpg&ga=GA1.1.605395950.1708799311&semt=sph',
        'https://i.ibb.co/S3sS7wL/1d4ab029-cab5-498e-9292-f3812199cd11.jpg',
    'https://img.freepik.com/free-photo/paddy-harvest-golden-yellow-paddy-hand-farmer-carrying-paddy-hand-rice_1150-45680.jpg?size=626&ext=jpg&ga=GA1.1.605395950.1708799311&semt=sph',
    'https://i.ibb.co/ydffsMM/09e1269f-61d6-4c8b-9259-e0d7b7510505.jpg',
    'https://img.freepik.com/free-photo/beautiful-woman-apron-posing-among-flowers-orangery_7502-7648.jpg?w=996&t=st=1708818001~exp=1708818601~hmac=21497edda56eb577f3ec396191b6eb923e809238b8e9abad3401e5f915f35e73'
  ];

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BotChatScreen(),
            ),
          );
        },
      ),
      drawer: const HomeDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,

        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Bit Harvesting',
          style: TextStyle(color: Colors.white),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.list_rounded),
        //   onPressed: () {},
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Column(
          children: [
            ClipRect(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WheatListTile(),
                      ),
                    );
                  },
                  child: const CardWidget(
                    icon: Icons.favorite_sharp,
                    name: "Seeds",
                  ),
                ),
                GestureDetector(
                  child: const CardWidget(
                    icon: Icons.settings,
                    name: "tools",
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ToolScreen(),
                      ),
                    );
                  },
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
                        builder: (context) => const FertilzerTool(),
                      ),
                    );
                  },
                  child: const CardWidget(
                    icon: Icons.favorite_sharp,
                    name: "Fertilizer",
                  ),
                ),
                GestureDetector(
                  child: const CardWidget(
                    icon: Icons.settings,
                    name: "Portfolio",
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CropPortfolio(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
