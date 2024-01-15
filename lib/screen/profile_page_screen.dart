
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracking_application/authentication/signin_page_screen.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {


  void signOut(BuildContext context){

    try{
      final authGate = Provider.of<AuthProviderClass>(context, listen: false);

      authGate.setIsLoadingFunction(true);

      authGate.signOut().then((value) async{

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
  
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
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

            Expanded(
                flex: 2,
                child: _buildUserInfo()),

            Expanded(
              flex: 5,
              child: Container(
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
                        signOut( context);
                      },
                      icon: Icons.logout,
                      txt: "Logout",
                      iClr: Color(0xffFD3C4A),
                      cClr: Color(0xffFFE2E4),
                    )

                  ],
                ),
              ),
            ),

            Expanded(
                flex: 2,
                child: Container(
                ))
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

Widget _buildUserInfo(){

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  return StreamBuilder(
      stream: firestore.collection("user_list").snapshots(), 
      builder: (context, snapshot){

        if(snapshot.data == null){
          return Text("No data found");
        }
        else if(snapshot.hasError){
          return Text("Something went wrong");
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return Column(children: [
            CircularProgressIndicator(),
            Text("Loading..."),
          ],);
        }
        else{
          return ListView(
            children: snapshot.data!.docs.map((e) => _buildUserInfoDetails(e)).toList(),
          );
        }
      }
  );
}

Widget _buildUserInfoDetails(DocumentSnapshot documentSnapshot){

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

  if(auth.currentUser!.email == data["email"]){
    return ListTile(
      leading: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: Color(0xffAD00FF)
          ),
          image: DecorationImage(image: NetworkImage(data["image"])),
        ),
      ),

      title: Text("Username",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xff91919F),
        ),
      ),

      subtitle: Text("${data["name"]}",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Color(0xff161719),
        ),
      ),

      trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.edit_sharp, size: 32, color: Color(0xff212325),)
      ),
    );

  } else{
    return Container();
  }
}

