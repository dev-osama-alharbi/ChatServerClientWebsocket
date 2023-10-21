
import 'package:chat_client_flutter/gui/pages/chat/widgets/chat_header_widget.dart';
import 'package:chat_client_flutter/gui/pages/chat/widgets/chat_msg_widget.dart';
import 'package:chat_client_flutter/gui/pages/chat/widgets/chat_text_field_widget.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static const String pageTitle = "ChatPage";
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Stack(
            children: const [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: ChatHeaderWidget(),
              ),
              Positioned(
                top: 80,
                left: 5,
                right: 5,
                bottom: 63,
                child: ChatMsgWidget(),
              ),
              Positioned(
                left: 5,
                right: 5,
                bottom: 0,
                child: ChatTextFieldWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
