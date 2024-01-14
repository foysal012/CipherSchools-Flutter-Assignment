import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/authentication/signup_page_screen.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPageScreen extends StatefulWidget {
  const ForgetPasswordPageScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPageScreen> createState() => _ForgetPasswordPageScreenState();
}

class _ForgetPasswordPageScreenState extends State<ForgetPasswordPageScreen> {

  TextEditingController emailController = TextEditingController();

  void resetPassword(){
    final authProvider = Provider.of<AuthProviderClass>(context, listen:  false);

    authProvider.setIsLoadingFunction(true);
    authProvider.resetUserPassword(emailController.text).then((value) {

      authProvider.setIsLoadingFunction(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset link sent successfully...")));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInPageScreen()), (route) => false);
    }).onError((error, stackTrace) {

      authProvider.setIsLoadingFunction(false);
      showToast(error.toString());
    });
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
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back, color: Color(0xff212325), size: 32, weight: 32,)
                  ),

                  SizedBox(
                    width: width * 0.19,
                  ),

                  Text("Reset Password",
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



              Consumer<AuthProviderClass>(builder: (context, value, child){
                return InkWell(
                  onTap: (){
                    resetPassword();
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
                      Text("Reset",
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
                height: height * 0.62,
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
