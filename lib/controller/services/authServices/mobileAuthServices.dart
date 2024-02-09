import 'dart:developer';

import 'package:blink_delivery/constant/constant.dart';
import 'package:blink_delivery/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:blink_delivery/view/authScreens/mobileLoginScreen.dart';
import 'package:blink_delivery/view/authScreens/otpScreen.dart';
import 'package:blink_delivery/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:blink_delivery/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MobileAuthServices {
  static bool checkAuthentication(BuildContext context) {
    User? user = auth.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileLoginScreen()),
          (route) => false);
      return false;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigationBarBlinkDelivery()),
              (route) => false);
      return true;
    }
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    try {
      auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credentials) {
          log(credentials.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
          throw Exception(exception);
        },
        codeSent: (String verificationID, int? resendToken) {
          context
              .read<MobileAuthProvider>()
              .updateVerificationID(verificationID);
          Navigator.push(
            context,
            PageTransition(
              child: const OTPScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<MobileAuthProvider>().verificationID!,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          child: SignInLogicScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
