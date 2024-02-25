import 'package:bit_harvesting/features/chat_bot/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class BotChatScreen extends StatefulWidget {
  const BotChatScreen({super.key});
  @override
  State<BotChatScreen> createState() => _BotChatScreenState();
}

class _BotChatScreenState extends State<BotChatScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<MyMessageCard> message_card_list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
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
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: message_card_list.length,
                          itemBuilder: (context, index) {
                            return MyMessageCard(
                              message: message_card_list[index].message,
                              time: message_card_list[index].time,
                              userName: message_card_list[index].userName,
                              isMe: message_card_list[index].isMe,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    message_card_list.add(
                      MyMessageCard(
                        message: _controller.text.toString(),
                        time: DateTime.now().minute.toString(),
                        userName: "You",
                        isMe: true,
                      ),
                    );
                    setState(() {});
                    _controller.text = '';
                    final apiKey = "AIzaSyAOCa9NJswYOI2naZb2gRbahO1UjIQz7dM";
                    final model =
                        GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
                    final content = [Content.text(_controller.text)];
                    final response = await model
                        .generateContent(content)
                        .then((value) => message_card_list.add(MyMessageCard(
                              message: value.text!,
                              time: DateTime.now().minute.toString(),
                              userName: 'Bot',
                              isMe: false,
                            )));

                    setState(() {});
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 33,
                  ),
                ),
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
