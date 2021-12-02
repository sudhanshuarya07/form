import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomePageProvider with ChangeNotifier{
  bool? isEligible;
  String? eligibilityMessage='';

  void checkEligibility(int age){
    if(age >=18){
      isEligible=true;
      eligibilityMessage="you are eligible";
      notifyListeners();
    }
    else{
      isEligible=false;
      eligibilityMessage="you are not eligible";
      notifyListeners();

    }
  }
}