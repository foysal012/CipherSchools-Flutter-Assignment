import 'package:expense_tracking_application/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final authProvider = Provider.of<AuthProvider>(context, listen:  false);

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

                Consumer<AuthProvider>(builder: (context, value, child){
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
                  child: Text("Sign Up",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xffFCFCFC),
                    ),
                  ),
                ),
              ),
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

            RichText(
              text: TextSpan(
                // text: 'By\n',
                // style: GoogleFonts.cambay(),
                children:  <TextSpan>[
                  //TextAlign.center
                  TextSpan(text: 'Already have an account? ', style: GoogleFonts.cambay(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff91919F)),),
                  TextSpan(text: 'Login', style: GoogleFonts.cambay(fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xff7F3DFF), decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Color(0xff7F3DFF)),),

                ],
              ),
            ),
          ],
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

      child: Consumer<AuthProvider>(builder: (context, value, child){
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
