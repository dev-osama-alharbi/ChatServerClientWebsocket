import 'package:chat_client_flutter/gui/pages/login/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String pageTitle = "LoginPage";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: LoginWidget(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
