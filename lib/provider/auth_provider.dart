import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{

  bool _isVisible = true;
  bool get isVisible => _isVisible;

 void setIsVisible(){
   _isVisible = !_isVisible;
   notifyListeners();
 }

 bool _checkValue = false;
 bool get checkVaue => _checkValue;

  void setCheckValue(bool val){
    //_checkValue = !_checkValue;
    _checkValue = val;
    notifyListeners();
  }

}