import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
      borderRadius: BorderRadius.circular(50),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: (){
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        }, 
        icon:const  Icon(Icons.send)
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        focusNode.requestFocus();
        textController.clear();
      },
    );
  }
}