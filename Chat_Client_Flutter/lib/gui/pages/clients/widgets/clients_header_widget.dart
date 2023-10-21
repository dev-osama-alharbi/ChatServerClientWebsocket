
import 'package:flutter/material.dart';

class ClientsHeaderWidget extends StatefulWidget {
  const ClientsHeaderWidget({Key? key}) : super(key: key);

  @override
  State<ClientsHeaderWidget> createState() => _ClientsHeaderWidgetState();
}

class _ClientsHeaderWidgetState extends State<ClientsHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.only(top: 30),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 50,),
                Expanded(
                  child: Container(
                    child: Text(
                      "Clients",
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
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_forward,color: Colors.blueGrey,),
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
      ),
    );
  }
}
