import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracking_application/authentication/forget_password_page_screen.dart';
import 'package:expense_tracking_application/authentication/signup_page_screen.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/screen/bottom%20%20nav%20bar/bottom_nav_bar_page_screen.dart';
import 'package:expense_tracking_application/screen/home_page_screen.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({Key? key}) : super(key: key);

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  void signIn(){
    try{
      final authProvider = Provider.of<AuthProviderClass>(context, listen:  false);
      authProvider.setIsLoadingFunction(true);
      
      authProvider.signInWithEmailAndPassword(
          emailController.text, 
          passwordController.text,
      ).then((value) {
        authProvider.setIsLoadingFunction(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignIn Successfully...")));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen()), (route) => false);
      }).onError((error, stackTrace) {
        authProvider.setIsLoadingFunction(false);
        showToast(error.toString());
      });

    } catch(e){
      showToast(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final authProvider = Provider.of<AuthProviderClass>(context, listen:  false);

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,

        padding: EdgeInsets.only(
            left: 20,
            right: 20
        ),

        decoration: BoxDecoration(
            color: Color(0xffFFFFFF)
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [

              SizedBox(
                height: height * 0.05,
              ),

              Row(
                children: [

                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back, color: Color(0xff212325), size: 32, weight: 32,)
                  ),

                  SizedBox(
                    width: width * 0.25,
                  ),

                  Text("Sign In",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Color(0xff212325),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: height * 0.05,
              ),

              SizedBox(
                height: height * 0.02,
              ),

              WidgetTextField(
                nameController: emailController,
                labelText: "Email",
              ),

              SizedBox(
                height: height * 0.02,
              ),

              WidgetTextField1(
                nameController: passwordController,
                labelText: "Password",
              ),

              SizedBox(
                height: height * 0.02,
              ),

              // Row(
              //   children: [
              //
              //     Consumer<AuthProvider>(builder: (context, value, child){
              //       return Checkbox(
              //         value: value.checkVaue,
              //         onChanged: (bool? val){
              //           value.setCheckValue(val!);
              //         },
              //       );
              //     }
              //     ),
              //
              //     RichText(
              //       text: TextSpan(
              //         // text: 'By\n',
              //         // style: GoogleFonts.cambay(),
              //         children:  <TextSpan>[
              //           //TextAlign.center
              //           TextSpan(text: 'By signing up, you agree to the ',
              //             style: GoogleFonts.inter(fontSize: 14, color: Color(0xff000000), fontWeight: FontWeight.w500),),
              //           TextSpan(text: 'Terms of \nService and Privacy Policy', style: GoogleFonts.inter(fontSize: 14, color: Color(0xff7F3DFF), fontWeight: FontWeight.w500),),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordPageScreen()));
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forget password?",
                  style: GoogleFonts.cambay(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff7F3DFF),
                  ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),

              Consumer<AuthProviderClass>(builder: (context, value, child){
                return InkWell(
                  onTap: (){
                      signIn();
                  },
                  child: Container(
                    height: 56,
                    width: 343,

                    padding: EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      color: Color(0xff7F3DFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: value.isLoading == true ? CircularProgressIndicator(color: Color(0xffFFFFFF),) :
                      Text("Sign In",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xffFCFCFC),
                        ),
                      ),
                    ),
                  ),
                );
              }),

              SizedBox(
                height: height * 0.01,
              ),

              Text("Or with",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff91919F),
                ),
              ),

              SizedBox(
                height: height * 0.01,
              ),

              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 56,
                  width: 343,

                  padding: EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Color(0xffF1F1FA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/google.png"),

                      SizedBox(
                        width: width * 0.02,
                      ),

                      Text("Sign In with Google",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff212325),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't  have an account? ",
                    style: GoogleFonts.cambay(
                        fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff91919F)),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPageScreen()));
                    },
                    child: Text("Register",
                      style: GoogleFonts.cambay(
                          fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xff7F3DFF),
                          decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Color(0xff7F3DFF)),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: height * 0.32,
              ),

              Container(
                height: 5,
                width: 134,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
