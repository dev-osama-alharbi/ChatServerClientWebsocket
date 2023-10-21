import 'dart:convert';

import 'package:chat_client_flutter/model/msg-model.dart';
import 'package:chat_client_flutter/service/Service.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:stomp_dart_client/stomp_handler.dart';

typedef NewMsg = void Function(MsgModel?);
typedef Notification = void Function(MsgModel?);

class WSService{
  final String url;
  NewMsg _newMsg = (m){};
  Notification _notification = (m){};
  StompClient? stompClient;


  WSService({required this.url}){
    _init();
  }

  set newMsg(void Function(MsgModel?) fun){
    this._newMsg = fun;
  }
  set notification(void Function(MsgModel?) fun){
    this._notification = fun;
  }

  _init(){
    stompClient = StompClient(
        config: StompConfig(
          url: url,
          onConnect: onConnect,
          onDisconnect:onDisconnect,
          onStompError:onStompError,
          onWebSocketError:onWebSocketError,
        ),
    );
  }

  connect() async {
    // disconnect();
    stompClient!.activate();
  }
  disconnect(){
    if(stompClient!.connected){
      stompClient!.deactivate();
    }
  }

  StompUnsubscribe? subscribeChat;
  StompUnsubscribe? subscribeNotification;
  onConnect(StompFrame stompFrame) {
    print("onConnect");
    subscribeChat = stompClient!.subscribe(destination: "/topic/chat", callback: (frame) {
      // String? result = json.decode(frame.body!);
      print("----> /topic/chat");
      MsgModel? result = MsgModel.fromJson(json.decode(frame.body!));
      _newMsg(result!);
    },);
    subscribeNotification = stompClient!.subscribe(destination: "/topic/notification", callback: (frame) {
      // String? result = json.decode(frame.body!);
      print("----> /topic/notification");
      MsgModel? result = MsgModel.fromJson(json.decode(frame.body!));
      _notification(result!);
    },);
  }

  onDisconnect(StompFrame frame) {
    print("onDisconnect");
    subscribeChat!();
    subscribeNotification!();
  }

  bool isConnect() {
    return stompClient!.connected;
  }

  sendMsg(String msg) {
    MsgModel model = MsgModel(Service.username,msg);
    stompClient!.send(destination: "/chat",body: json.encode(model.toJson()));
    print("sendTest1");
  }

  void onStompError(StompFrame p1) {
    print("onStompError "+p1.toString());
  }

  void onWebSocketError(p1) {
    print("onWebSocketError "+p1);
    print("onWebSocketError1 "+p1.toString());
  }
}