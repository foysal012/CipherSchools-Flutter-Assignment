import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderClass with ChangeNotifier{

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

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoadingFunction(bool value){
    _isLoading = value;
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndexFunction(int value){
    _currentIndex = value;
    notifyListeners();
  }

  //create user
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password, String name)async{

    try{

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );


      return userCredential;
    } on FirebaseException catch (e){
      throw Exception(e.code);
    }

  }


  //Login user
  Future<UserCredential> signInWithEmailAndPassword(String email, String password,)async{

    try{

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );


      return userCredential;
    } on FirebaseException catch (e){
      throw Exception(e.code);
    }

  }

  //Logout user
  Future<void> signOut() async {
   await auth.signOut();
  }

  //reset user
  Future<void> resetUserPassword(String email) async{
    await auth.sendPasswordResetEmail(email: email);
  }

}