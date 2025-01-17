import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> otherReplay () async{
    final otherMessage = await getYesNoAnswer.getAnswer();

    messageList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }


  //Enviar mesaje
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );

    if(text.endsWith('?')){
      otherReplay();
    }

    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  //mover el scroll al final
  Future<void> moveScrollToBottom () async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}