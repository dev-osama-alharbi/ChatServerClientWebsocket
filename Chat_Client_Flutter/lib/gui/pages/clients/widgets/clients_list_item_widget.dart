import 'package:chat_client_flutter/model/msg-model.dart';
import 'package:flutter/material.dart';

class ClientsListItemWidget extends StatelessWidget {
  ClientsListItemWidget(this.msg,{Key? key}) : super(key: key);
  MsgModel msg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(msg.msg,textAlign: TextAlign.center,),
      leading: IconButton(
        icon: Icon(Icons.info,color: Colors.blueAccent),
        onPressed: () {
        },
      ),
    );
  }
}
