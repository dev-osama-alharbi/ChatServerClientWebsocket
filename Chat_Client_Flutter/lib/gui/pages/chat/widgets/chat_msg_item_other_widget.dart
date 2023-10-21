import 'package:chat_client_flutter/model/msg-model.dart';
import 'package:flutter/material.dart';

class ChatMsgItemOtherWidget extends StatelessWidget {
  ChatMsgItemOtherWidget(this.msg,{Key? key}) : super(key: key);
  MsgModel? msg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .6),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      msg!.username,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      msg!.msg,
                    ),
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.black12,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      msg!.dateTime,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
