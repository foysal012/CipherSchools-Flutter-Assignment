import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/screen/bottom%20%20nav%20bar/bottom_nav_bar_page_screen.dart';
import 'package:expense_tracking_application/screen/home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
 const AuthGate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
                return BottomNavigationBarPageScreen();
            } else {
                return SignInPageScreen();
            }
          }
      ),
    );
  }
}
