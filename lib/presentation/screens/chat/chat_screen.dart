import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  final String avatar =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ),
        title: const Text('Bot'),
      ),
      body: _ChatView(),
    );
  }
}

//Body
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return message.fromWho == FromWho.me
                      ? MyMessageBubble(message: message)
                      : OtherMessageBubble(message: message,);
              },)
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
