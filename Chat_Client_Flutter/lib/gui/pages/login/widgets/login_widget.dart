import 'package:chat_client_flutter/gui/pages/login/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Align(
            alignment: Alignment.center,
            widthFactor: 200,
            heightFactor: 200,
            child: LoginFormWidget(),
          ),
        )
      ],
    );
  }
}
