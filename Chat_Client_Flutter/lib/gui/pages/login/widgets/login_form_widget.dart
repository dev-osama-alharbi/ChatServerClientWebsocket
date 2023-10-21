import 'package:chat_client_flutter/gui/pages/chat/chat.dart';
import 'package:chat_client_flutter/service/Service.dart';
import 'package:chat_client_flutter/service/ws/WSService.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  TextEditingController tcUrl = TextEditingController(text: "ws://192.168.8.38:8080/ws");
  TextEditingController tcUsername = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // Expanded(child: Container()),
                        SizedBox(height: 40.0),
                        Container(
                          padding: EdgeInsets.all(4), // Border width
                          decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              shape: BoxShape.circle),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(100), // Image radius
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 40.0),
                            Text(
                              "SpringBoot_ar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              "chat client Flutter",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        // Icon(
                        //   Icons.person,
                        //   color: Colors.blueGrey,
                        //   size: 100.0,
                        // ),
                        Expanded(child: Container(),),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        enabled: true,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        controller: tcUrl,
                        decoration: InputDecoration(
                          labelText: "HostUrl",
                          hintText: "localhost:8080/ws/",
                          prefixIcon: Icon(Icons.wb_cloudy),
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
                      SizedBox(height: 15.0),
                      TextFormField(
                        enabled: true,
                        autofocus: false,
                        keyboardType: TextInputType.phone,
                        controller: tcUsername,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "",
                          prefixIcon: Icon(Icons.person),
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
                      // SizedBox(height: 15.0),
                      // TextFormField(
                      //   enabled: true,
                      //   autofocus: false,
                      //   keyboardType: TextInputType.phone,
                      //   controller: tcPhone,
                      //   decoration: InputDecoration(
                      //     labelText: "ChatPassword",
                      //     hintText: "123456",
                      //     prefixIcon: Icon(Icons.password),
                      //     contentPadding:
                      //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(32.0)),
                      //     // errorText: _isPhoneError ? _errorStr : null,
                      //     errorStyle: TextStyle(height: 0),
                      //   ),
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.blueGrey,
                      //     fontSize: 17,
                      //   ),
                      //   textAlign: TextAlign.center,
                      //   onChanged: (str) {},
                      // ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16.0)),
                            fixedSize: MaterialStateProperty.all(
                                Size.fromWidth(double.maxFinite)),
                          ),
                          onPressed: () {
                            if(Service.wsService != null){
                              if(Service.wsService!.isConnect()){
                                Service.wsService!.disconnect();
                              }
                            }
                            if(tcUsername.text.isNotEmpty){
                              Service.username = tcUsername.text;
                              Service.wsService = WSService(url: tcUrl.text);
                              Service.wsService?.connect();
                              Navigator.pushNamed(context, Chat.pageTitle);
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
