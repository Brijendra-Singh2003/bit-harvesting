import 'package:bit_harvesting/features/chat_bot/widgets/message_card.dart';
import 'package:flutter/material.dart';

class BotChatScreen extends StatefulWidget {
  const BotChatScreen({super.key});
  @override
  State<BotChatScreen> createState() => _BotChatScreenState();
}
class _BotChatScreenState extends State<BotChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'May I Help You ?',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child:const Column(
                  children: [
                    MyMessageCard(message: 'Hello Chat Bot 👋', time: '09:32',userName: 'You',isMe: true,),
                    MyMessageCard(message: 'Hey what can i help U ?', time: '09:33',userName: 'You',isMe: false,),
                  ],
                ),
              ),
            ),
            TextField(
              
              decoration: InputDecoration(
                
                suffixIcon:GestureDetector(
                  onTap: (){},
                  child: const Icon(Icons.send,color: Colors.green,size: 33,),),
                hintText: 'Want a Suggestion?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
