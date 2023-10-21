

import 'package:chat_client_flutter/model/msg-model.dart';
import 'package:chat_client_flutter/service/ws/WSService.dart';

class Service{
  static WSService ?wsService;
  static String username = "";
  static List<MsgModel> notifications = [];
}