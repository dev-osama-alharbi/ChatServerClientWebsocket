
import 'package:chat_client_flutter/gui/pages/clients/clients.dart';
import 'package:chat_client_flutter/service/Service.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatefulWidget {
  const ChatHeaderWidget({Key? key}) : super(key: key);

  @override
  State<ChatHeaderWidget> createState() => _ChatHeaderWidgetState();
}

class _ChatHeaderWidgetState extends State<ChatHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Service.wsService!.disconnect();
                  Navigator.pop(context);
                },
                child: Icon(Icons.power_settings_new_sharp,color: Colors.red,),
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  // padding: EdgeInsets.all(24),
                  fixedSize: Size.square(40),
                  backgroundColor: Colors.red.shade100,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "SpringBoot_ar Chat",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context,Clients.pageTitle);
                },
                child: Icon(Icons.person,color: Colors.blueGrey,),
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  fixedSize: Size.square(40),
                  backgroundColor: Colors.blueGrey.shade200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
