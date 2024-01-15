import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePageScreen extends StatefulWidget {
  const ExpensePageScreen({Key? key}) : super(key: key);

  @override
  State<ExpensePageScreen> createState() => _ExpensePageScreenState();
}

class _ExpensePageScreenState extends State<ExpensePageScreen> {

  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController walletController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,

        // padding: EdgeInsets.only(
        //   left: 20,
        //   right: 20,
        // ),

        decoration: BoxDecoration(
          color: Color(0xff0077FF)
        ),
        
        child: Column(
          children: [
            
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),

                    Row(
                      children: [

                        IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.arrow_back, color: Colors.white, size: 32,)
                        ),

                        SizedBox(
                          width: width * 0.25,
                        ),

                        Text("Expense",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: height * 0.16,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("How much?",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Color(0xffFCFCFC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.02,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text("₹",
                            style: GoogleFonts.inter(
                              fontSize: 64,
                              color: Color(0xffFCFCFC),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(
                            width: width * 0.02,
                          ),

                          Text("0",
                            style: GoogleFonts.inter(
                              fontSize: 64,
                              color: Color(0xffFCFCFC),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),

            Expanded(
              child: Container(
                width: double.infinity,

                // padding: EdgeInsets.only(
                //   left: 20,
                //   right: 20
                // ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),

                          WidgetTextField(
                            categoryController: categoryController,
                            txt: "Category",
                            onTap: (){

                            },
                          ),

                          SizedBox(
                            height: height * 0.01,
                          ),

                          WidgetTextField1(
                            categoryController: descriptionController,
                            txt: "Descritpion",
                          ),

                          SizedBox(
                            height: height * 0.01,
                          ),

                          WidgetTextField(
                            categoryController: walletController,
                            txt: "Wallet",
                            onTap: (){

                            },
                          ),

                          SizedBox(
                            height: height * 0.03,
                          ),
                        ],
                      ),
                    ),



                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xff0077FF),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.03,
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
                          child: Text("Continue",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Color(0xffFCFCFC),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.03,
                    ),

                    Container(
                      height: 5,
                      width: 134,
                      decoration: BoxDecoration(
                        color: Color(0xff000000)
                      ),
                    ),

                    SizedBox(
                      height: height * 0.005,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    required this.categoryController,
    required this.txt,
    required this.onTap,
  });

  final TextEditingController categoryController;
  final String txt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: categoryController,

      decoration: InputDecoration(

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xffF1F1FA)
          )
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                width: 1,
                color: Color(0xffF1F1FA)
            )
        ),

        labelText: "$txt",
        labelStyle: GoogleFonts.inter(
          color: Color(0xff91919F),
          fontWeight: FontWeight.w400,
          fontSize: 16
        ),
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(Icons.keyboard_arrow_down,size: 32,color: Color(0xff91919F),),
        )
      ),
    );
  }
}

class WidgetTextField1 extends StatelessWidget {
  const WidgetTextField1({
    super.key,
    required this.categoryController,
    required this.txt,
  });

  final TextEditingController categoryController;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: categoryController,

      decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffF1F1FA)
              )
          ),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffF1F1FA)
              )
          ),

          labelText: "$txt",
          labelStyle: GoogleFonts.inter(
              color: Color(0xff91919F),
              fontWeight: FontWeight.w400,
              fontSize: 16
          ),
      ),
    );
  }
}