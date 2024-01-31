import 'package:blink_delivery/view/authScreens/mobileLoginScreen.dart';
import 'package:blink_delivery/view/authScreens/otpScreen.dart';
import 'package:blink_delivery/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,_,__){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: BottomNavigationBarBlinkDelivery(),
      );
    });

  }
}

