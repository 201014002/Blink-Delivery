import 'package:flutter/cupertino.dart';

class MobileAuthProvider extends ChangeNotifier{
  String? mobileNumber;
  String? verificationID;
  updateVerificationID(String verification){
    verificationID=verification;
    notifyListeners();
  }
  updateMobileNumber(String number){
    mobileNumber=number;
    notifyListeners();
  }
}