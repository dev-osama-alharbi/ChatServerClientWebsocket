
import 'package:chat_client_flutter/service/Service.dart';
import 'package:flutter/material.dart';

class ChatTextFieldWidget extends StatefulWidget {
  const ChatTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<ChatTextFieldWidget> createState() => _ChatTextFieldWidgetState();
}

class _ChatTextFieldWidgetState extends State<ChatTextFieldWidget> {
  TextEditingController tcTextMsg = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enabled: true,
              autofocus: false,
              keyboardType: TextInputType.none,
              controller: tcTextMsg,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                // errorText: _isPhoneError ? _errorStr : null,
                errorStyle: TextStyle(height: 0),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
              onChanged: (str) {},
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if(tcTextMsg.text.isNotEmpty){
                Service.wsService!.sendMsg(tcTextMsg.text);
                tcTextMsg.text = "";
              }
            },
            child: Icon(Icons.send,color: Colors.red,),
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              // padding: EdgeInsets.all(24),
              fixedSize: Size.square(40),
              backgroundColor: Colors.red.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
