import 'package:chat_client_flutter/main/app_router.dart';
import 'package:chat_client_flutter/gui/pages/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  String initPageTitle = Login.pageTitle;


  final AppRouter appRouter;
  MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.route,
      initialRoute: initPageTitle,
    );
  }
}