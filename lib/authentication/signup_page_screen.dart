import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/provider/auth_services_provider_google.dart';
import 'package:expense_tracking_application/screen/bottom%20%20nav%20bar/bottom_nav_bar_page_screen.dart';
import 'package:expense_tracking_application/screen/home_page_screen.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void signUp(){
   try{
     var authProvider = Provider.of<AuthProviderClass>(context, listen:  false);

     FirebaseAuth auth = FirebaseAuth.instance;

      authProvider.setIsLoadingFunction(true);

     authProvider.signUpWithEmailAndPassword(
       emailController.text,
       passwordController.text,
       nameController.text,
     ).then((value) async{
       authProvider.setIsLoadingFunction(false);

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignUp Successfully...")));
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen()), (route) => false);
     }).onError((error, stackTrace) {
       authProvider.setIsLoadingFunction(false);
       showToast(error.toString());
     });
   } catch (e){

      showToast(e.toString());
   }

  }

  void signInWithGoogle(){
    try{
      final authServicesProviderGoogle = Provider.of<AuthServicesProviderGoogle>(context, listen:  false);

      authServicesProviderGoogle.signInWithGoogle(context);

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

                  Text("Sign Up",
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

              WidgetTextField(
                  nameController: nameController,
              labelText: "Name",
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

              Row(
                children: [

                  Consumer<AuthProviderClass>(builder: (context, value, child){
                    return Checkbox(
                        value: value.checkVaue,
                        onChanged: (bool? val){
                          value.setCheckValue(val!);
                        },
                    );
                  }
                  ),

                  RichText(
                    text: TextSpan(
                      // text: 'By\n',
                      // style: GoogleFonts.cambay(),
                      children:  <TextSpan>[
                        //TextAlign.center
                        TextSpan(text: 'By signing up, you agree to the ',
                          style: GoogleFonts.inter(fontSize: 14, color: Color(0xff000000), fontWeight: FontWeight.w500),),
                        TextSpan(text: 'Terms of \nService and Privacy Policy', style: GoogleFonts.inter(fontSize: 14, color: Color(0xff7F3DFF), fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.02,
              ),

              InkWell(
                onTap: (){
                signUp();
                },
                child: Consumer<AuthProviderClass>(builder: (context, value, child){
                  return Container(
                    height: 56,
                    width: 343,

                    padding: EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      color: Color(0xff7F3DFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: value.isLoading == true ? CircularProgressIndicator(color: Color(0xffFFFFFF)) :
                      Text("Sign Up",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xffFCFCFC),
                        ),
                      )
                    ),
                  );
                })
              ),

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
                  signInWithGoogle();
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

                      Text("Sign Up with Google",
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
                Text("Already have an account? ",
                  style: GoogleFonts.cambay(
                      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff91919F)),
                ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPageScreen()));
                    },
                    child: Text("Login",
                    style: GoogleFonts.cambay(
                        fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xff7F3DFF),
                        decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Color(0xff7F3DFF)),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: height * 0.21,
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

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    required this.nameController,
    required this.labelText,
  });

  final TextEditingController nameController;

  final String labelText;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 343,
      padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xffF1F1FA)
        ),
        color: Color(0xffFFFFFF),
      ),

      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "${labelText}",
          labelStyle: GoogleFonts.inter(
            color: Color(0xff91919F),
            fontSize: 16,
              fontWeight: FontWeight.w400
          ),
        )
      ),

    );
  }
}


class WidgetTextField1 extends StatelessWidget {
  const WidgetTextField1({
    super.key,
    required this.nameController,
    required this.labelText,
  });

  final TextEditingController nameController;

  final String labelText;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 343,
      padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xffF1F1FA)
        ),
        color: Color(0xffFFFFFF),
      ),

      child: Consumer<AuthProviderClass>(builder: (context, value, child){
        return TextFormField(
            controller: nameController,
            obscureText: value.isVisible,
            obscuringCharacter: "#",
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "${labelText}",
                labelStyle: GoogleFonts.inter(
                    color: Color(0xff91919F),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
                suffixIcon: IconButton(
                  onPressed: (){
                    value.setIsVisible();
                  },
                  icon: Icon( value.isVisible == true ? Icons.visibility_off : Icons.visibility),
                )
            )
        );

      }
      )

    );
  }
}
