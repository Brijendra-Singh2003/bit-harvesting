// import 'package:bit_harvesting/common/screens/home_screen_drawer.dart';
// import 'package:bit_harvesting/common/screens/tools_screen.dart';
// import 'package:bit_harvesting/constant/wheat_list_tile.dart';
// import 'package:bit_harvesting/features/chat_bot/screens/bot_chat_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.message),
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => const BotChatScreen(),
//             ),
//           );
//         },
//       ),
//       drawer: const HomeDrawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade600,
//         centerTitle: true,
//         title: const Text(
//           'Bit Harvesting',
//           style: TextStyle(color: Colors.white),
//         ),
//         // leading: IconButton(
//         //   icon: const Icon(Icons.list_rounded),
//         //   onPressed: () {},
//         // ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 28.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const WheatListTile(),
//                       ),
//                     );
//                   },
//                   child:const CardWidget(
//                     icon: Icons.favorite_sharp,
//                     name: "Seeds",
//                   ),
//                 ),
//                 GestureDetector(
//                   child:const CardWidget(
//                     icon: Icons.settings,
//                     name: "tools",
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const ToolScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CardWidget(
//                   icon: Icons.polymer_outlined,
//                   name: "Ferti  ",
//                 ),
//                 CardWidget(
//                   icon: Icons.cookie_sharp,
//                   name: "Crop  ",
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardWidget extends StatelessWidget {
//   final String name;
//   final IconData icon;

//   const CardWidget({
//     super.key,
//     required this.name,
//     required this.icon,
//   });
 
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 20, left: 13, right: 13),
//       padding: const EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.green[400]!,
//             Colors.green,
//           ],
//         ),
//       ),
//       child: Center(
//         child: Column(
//           children: [
//              Icon(icon,color: Colors.white,), 
//             Text(
//               name,
//               style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  final apiKey = Platform.environment['API_KEY'];
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final content = [Content.text('Write a story about a magic backpack.')];
  final response = await model.generateContent(content);
  print(response.text);
}