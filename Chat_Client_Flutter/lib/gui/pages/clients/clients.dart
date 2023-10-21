
import 'package:chat_client_flutter/gui/pages/clients/widgets/clients_header_widget.dart';
import 'package:chat_client_flutter/gui/pages/clients/widgets/clients_list_widget.dart';
import 'package:chat_client_flutter/service/Service.dart';
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  static const String pageTitle = "ClientsPage";
  const Clients({Key? key}) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    Service.wsService!.notification = (msg){
      Service.notifications.add(msg!);
    };
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: const [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClientsHeaderWidget(),
            ),
            Positioned(
              top: 80,
              left: 5,
              right: 5,
              bottom: 0,
              child: ClientsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
