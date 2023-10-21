import 'package:chat_client_flutter/gui/pages/chat/chat.dart';
import 'package:chat_client_flutter/gui/pages/clients/clients.dart';
import 'package:chat_client_flutter/gui/pages/login/login.dart';
import 'package:flutter/material.dart';


class AppRouter{
  Route? route(RouteSettings settings){
    switch (settings.name) {
      case Login.pageTitle:
        return MaterialPageRoute(builder: (_)=> const Login());
      case Chat.pageTitle:
        return MaterialPageRoute(builder: (_)=> const Chat());
      case Clients.pageTitle:
        return MaterialPageRoute(builder: (_)=> const Clients());
      default:
        return MaterialPageRoute(builder: (_)=> const Login());
    }
  }
}