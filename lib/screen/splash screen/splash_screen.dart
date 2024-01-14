import 'dart:async';

import 'package:expense_tracking_application/screen/getting%20started%20screen/getting_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 2),
            () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => GettingStartedScreen()), (route) => false);
            }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String originalString = "CIPHERX";
    String modifiedString = titleName(originalString);


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Color(0xff7B61FF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: height * 0.33,
                ),

                Image.asset("images/Vector.png"),

                Text("${modifiedString}",
                  style: GoogleFonts.brunoAceSc(
                      fontSize: 36,
                      color: Color(0xffFFFFFF)
                  ),
                ),

                SizedBox(
                  height: height * 0.30,
                ),

                Column(
                  children: [

                    Text("By",
                      style: GoogleFonts.cambay(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        // text: 'By\n',
                        // style: GoogleFonts.cambay(),
                        children:  <TextSpan>[
                          //TextAlign.center
                          TextSpan(text: 'Open ', style: GoogleFonts.cambay(fontSize: 16),),
                          TextSpan(text: 'Source', style: GoogleFonts.cambay(fontSize: 16),),
                          TextSpan(text: ' Community',
                              style: GoogleFonts.cambay(color: Color(0xffF8A401), fontSize: 16)
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.035,
                ),

                Container(
                  height: 5,
                  width: 134,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                SizedBox(
                  height: height * 0.008,
                ),

              ],
            ),
          ),

          Positioned(
              top: 3,
              right: 2,
              child: Image.asset("images/recordcircle.png")
          ),

          Positioned(
              bottom: 3,
              left: 2,
              child: Image.asset("images/recordcircle1.png")
          )
        ],
      )
    );
  }
}

void showToast(String msg){
  Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

String titleName(String txt){

  String firstLetter = txt.substring(0, 1).toUpperCase();
  String lastLetter = txt.substring(txt.length - 1).toUpperCase();
  String middlePart = txt.substring(1, txt.length - 1).toLowerCase();

  return '$firstLetter$middlePart$lastLetter';
}
