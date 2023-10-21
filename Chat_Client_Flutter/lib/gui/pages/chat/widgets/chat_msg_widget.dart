
import 'package:chat_client_flutter/gui/pages/chat/widgets/chat_msg_item_me_widget.dart';
import 'package:chat_client_flutter/gui/pages/chat/widgets/chat_msg_item_other_widget.dart';
import 'package:chat_client_flutter/model/msg-model.dart';
import 'package:chat_client_flutter/service/Service.dart';
import 'package:flutter/material.dart';

class ChatMsgWidget extends StatefulWidget {
  const ChatMsgWidget({Key? key}) : super(key: key);

  @override
  State<ChatMsgWidget> createState() => _ChatMsgWidgetState();
}

class _ChatMsgWidgetState extends State<ChatMsgWidget> {

  List<MsgModel?> msgs = [];

  @override
  void initState() {
    super.initState();
    Service.notifications = [];
    Service.wsService!.newMsg = (msg){
      setState(() {
        msgs.add(msg);
      });
    };
    Service.wsService!.notification = (msg){
      setState(() {
        Service.notifications.add(msg!);
      });
    };
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    Service.wsService!.notification = (msg){
      Service.notifications.add(msg!);
    };
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.green,
      padding: const EdgeInsets.only(
        top: 30,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          if(msgs[index] != null){
            if(msgs[index]?.username == Service.username) {
              return ChatMsgItemMeWidget(msgs[index]);
            } else {
              return ChatMsgItemOtherWidget(msgs[index]);
            }
          }else {
            return ChatMsgItemOtherWidget(MsgModel("Err","Err"));
          }
        },
        itemCount: msgs.length,
      ),
    );
  }
}
