import 'package:blink_delivery/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:blink_delivery/view/authScreens/mobileLoginScreen.dart';
import 'package:blink_delivery/view/authScreens/otpScreen.dart';
import 'package:blink_delivery/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:blink_delivery/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blink_delivery/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BlinkDelivery());
}

class BlinkDelivery extends StatelessWidget {
  const BlinkDelivery({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<MobileAuthProvider>(
            create: (_) => MobileAuthProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: SignInLogicScreen(),
        ),
      );
    });
  }
}
