import 'package:flutter/material.dart';
import 'package:plute/pages/home.dart';
import 'package:plute/service/connectvity_service.dart';
import 'package:provider/provider.dart';

import 'enums/connectivity_status.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus> .controller(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        title: 'Plute',
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
