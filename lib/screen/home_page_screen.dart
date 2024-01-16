import 'package:expense_tracking_application/screen/tab%20ber/month.dart';
import 'package:expense_tracking_application/screen/tab%20ber/today.dart';
import 'package:expense_tracking_application/screen/tab%20ber/week.dart';
import 'package:expense_tracking_application/screen/tab%20ber/year.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> with SingleTickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(initialIndex: 0,length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(

      body: Container(

        height: double.infinity,
        width: double.infinity,
        
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        
        decoration: BoxDecoration(
          color: Color(0xffFCFCFC)
        ),

        child: Column(
          children: [

          Expanded(
            child:   Container(

            height: double.infinity,
            width: double.infinity,

            // padding: EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),

            decoration: BoxDecoration(
                color: Color(0xffFFF6E5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                )
            ),
            child: Column(
              children: [

                SizedBox(
                  height: height * 0.05,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.keyboard_arrow_down, size: 24, color: Color(0xff7F3DFF),),
                        Text("October",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff212325),
                          ),
                        )
                      ],
                    ),

                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.notifications, size: 32, color: Color(0xff7F3DFF),)
                    )
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                Text("Account Balance",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff91919F)
                  ),
                ),

                SizedBox(
                  height: height * 0.01,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("₹",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff161719)
                      ),
                    ),
                    Text("38000",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff161719)
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 80,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color(0xff00A86B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffFCFCFC)
                            ),
                            child: Image.asset("images/income.png"),
                          ),

                          SizedBox(
                            width: width * 0.025,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Income",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFCFCFC),
                                  fontSize: 14,
                                ),
                              ),

                              Text("₹50000",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFCFCFC),
                                  fontSize: 22,
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: width * 0.03,
                    ),

                    Container(
                      height: 80,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color(0xffFD3C4A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffFCFCFC)
                            ),
                            child: Image.asset("images/expense.png"),
                          ),

                          SizedBox(
                            width: width * 0.025,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expenses",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFCFCFC),
                                  fontSize: 14,
                                ),
                              ),

                              Text("₹12000",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFCFCFC),
                                  fontSize: 22,
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),



              ],
            ),
          ),),

            SizedBox(
              height: height * 0.02,
            ),
            
            Expanded(
                child: Container(

              child: Column(
                children: [

                  Container(
                    height: 34,
                    width: 346,
                    decoration: BoxDecoration(
                      color: Color(0xffFCFCFC),
                    ),
                    child: Container(
                      height: 34,
                      width: 90,
                      child: TabBar(
                        controller: tabController,
                        // onTap: (value){
                        //
                        // },
                        tabs: [
                            // Text("Today"),
                            // Text("Week"),
                            // Text("Month"),
                            // Text("Year"),
                          Container(
                            height: 34,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text("Today")),
                          ),

                          Container(
                            height: 34,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text("Week")),
                          ),

                          Container(
                            height: 34,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text("Month")),
                          ),

                          Container(
                            height: 34,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text("Year")),
                          ),
                        ],
                      ),
                    )
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recent Transaction",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff292B2D),
                      ),
                      ),

                      Container(
                        height: 32, 
                          width: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xffEEE5FF)
                        ),
                        child: Center(
                          child: Text("See All",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7F3DFF),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Today(),
                          Week(),
                          Month(),
                          Year()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))

            
          ],
        ),
      ),
    );
  }
}
