import 'dart:async';

import 'package:expense_tracking_application/authentication/signup_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Timer(
  //       Duration(seconds: 2),
  //           () {
  //
  //       }
  //   );
  //   super.initState();
  // }

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

              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),

              decoration: BoxDecoration(
                color: Color(0xff7B61FF),
              ),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 //mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: height * 0.1,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset("images/Vector1.png"),
                  ),

                  SizedBox(
                    height: height * 0.52,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: [
                          Text("Welcome to",
                            style: GoogleFonts.aBeeZee(
                              color: Color(0xffFFFFFF),
                              fontSize: 40,
                            ),
                          ),

                          Text("${modifiedString}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.brunoAceSc(
                                fontSize: 36,
                                color: Color(0xffFFFFFF)
                            ),
                          ),
                        ],
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignUpPageScreen()), (route) => false);
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEDE1E1BF),
                          ),
                          child: Icon(Icons.arrow_forward_ios, size: 48.53, weight: 25, color: Color(0xff060607),),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: height * 0.009,
                  ),

                  Text("The best way to track your expenses",
                  style: GoogleFonts.aBeeZee(
                    color: Color(0xffFFFFFF),
                    fontSize: 20,
                  ),
                  ),

                  // Column(
                  //   children: [
                  //
                  //     Text("By",
                  //       style: GoogleFonts.cambay(
                  //         color: Color(0xffFFFFFF),
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //
                  //     RichText(
                  //       text: TextSpan(
                  //         // text: 'By\n',
                  //         // style: GoogleFonts.cambay(),
                  //         children:  <TextSpan>[
                  //           //TextAlign.center
                  //           TextSpan(text: 'Open ', style: GoogleFonts.cambay(fontSize: 16),),
                  //           TextSpan(text: 'Source', style: GoogleFonts.cambay(fontSize: 16),),
                  //           TextSpan(text: ' Community',
                  //               style: GoogleFonts.cambay(color: Color(0xffF8A401), fontSize: 16)
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(
                    height: height * 0.06,
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

String titleName(String txt){

  String firstLetter = txt.substring(0, 1).toUpperCase();
  String lastLetter = txt.substring(txt.length - 1).toUpperCase();
  String middlePart = txt.substring(1, txt.length - 1).toLowerCase();

  return '$firstLetter$middlePart$lastLetter';
}
