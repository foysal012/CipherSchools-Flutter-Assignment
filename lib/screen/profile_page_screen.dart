import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {


  void signOut(){

    try{
      final authGate = Provider.of<AuthProviderClass>(context, listen: false);

      authGate.setIsLoadingFunction(true);

      authGate.signOut().then((value) {

        authGate.setIsLoadingFunction(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignOut Successfully...")));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInPageScreen()), (route) => false);

      }).onError((error, stackTrace){

        authGate.setIsLoadingFunction(false);
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

    final authGate = Provider.of<AuthProviderClass>(context, listen: false);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        padding: EdgeInsets.only(
          left: 20,
          right: 20
        ),

        decoration: BoxDecoration(
          //color: Color(0xffFFFFFF).withOpacity(0.1),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [

            SizedBox(
              height: height * 0.05,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink,
                  ),
                ),

                Column(
                  children: [

                    Text("Username",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff91919F),
                      ),
                    ),

                    Text("Khushi Sharma",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff161719),
                      ),
                    ),


                  ],
                ),

                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit_sharp, size: 32, color: Color(0xff212325),)
                )

              ],
            ),

            SizedBox(
              height: height * 0.1,
            ),

            Container(
              height: 362,
              width: 356,
              // padding: EdgeInsets.only(
              //   left: 20,
              //   right: 20
              // ),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  WidgetProfileIconButton(
                    width: width,
                    onTap: (){},
                    icon: Icons.account_balance_wallet,
                    txt: "Account",
                    iClr: Color(0xff7F3DFF),
                    cClr: Color(0xffEEE5FF),
                  ),

                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),

                  WidgetProfileIconButton(
                    width: width,
                    onTap: (){},
                    icon: Icons.settings,
                    txt: "Settings",
                    iClr: Color(0xff7F3DFF),
                    cClr: Color(0xffEEE5FF),
                  ),

                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),

                  WidgetProfileIconButton(
                    width: width,
                    onTap: (){},
                    icon: Icons.upload,
                    txt: "Export Data",
                    iClr: Color(0xff7F3DFF),
                    cClr: Color(0xffEEE5FF),
                  ),

                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),

                  WidgetProfileIconButton(
                    width: width,
                    onTap: (){
                      signOut();
                    },
                    icon: Icons.logout,
                    txt: "Logout",
                    iClr: Color(0xffFD3C4A),
                    cClr: Color(0xffFFE2E4),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetProfileIconButton extends StatelessWidget {
  const WidgetProfileIconButton({
    super.key,
    required this.width,
    required this.icon,
    required this.iClr,
    required this.cClr,
    required this.txt,
    required this.onTap,
  });

  final double width;
  final IconData icon;
  final Color iClr;
  final Color cClr;
  final String txt;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 89,
        width: 356,
        padding: EdgeInsets.only(
            left: 20,
            right: 20
        ),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: cClr,
              ),
              child: Icon(icon,
                size: 24, color: iClr),
            ),

            SizedBox(
              width: width * 0.03,
            ),

            Text("$txt",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff292B2D)
            ),
            )
          ],
        ),
      ),
    );
  }
}
