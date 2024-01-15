
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracking_application/screen/bottom%20%20nav%20bar/bottom_nav_bar_page_screen.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServicesProviderGoogle with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Google Sign In
   signInWithGoogle(BuildContext context) async{
    try{
      //begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      //obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      //create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      print("ki obostha? ${credential.secret}");
      print("ki obostha? ${credential.signInMethod}");

      //finally lets sign in
      return await auth.signInWithCredential(credential).then((value) async{

        //data save on sharepreference for user login or logout
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if(credential.accessToken != null){
          sharedPreferences.setString("token", "${credential.accessToken}");
          print("now token is : ${sharedPreferences.getString("token")}");
          notifyListeners();
        } else{

        }

        // add user info in the firestore database
        firestore.collection("user_list").doc(auth.currentUser!.uid).set({
          "name" : auth.currentUser!.displayName,
          "email" : auth.currentUser!.email,
          "uid" : auth.currentUser!.uid,
          "image" : auth.currentUser!.photoURL,
        });

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen()), (route) => false);

      });
    } catch (e){
      showToast(e.toString());
    }
  }







}

