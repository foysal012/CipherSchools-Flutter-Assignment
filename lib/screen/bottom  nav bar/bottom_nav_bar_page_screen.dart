import 'dart:math';

import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/screen/budget_page_screen.dart';
import 'package:expense_tracking_application/screen/expense_page_screen.dart';
import 'package:expense_tracking_application/screen/home_page_screen.dart';
import 'package:expense_tracking_application/screen/income_page_screen.dart';
import 'package:expense_tracking_application/screen/profile_page_screen.dart';
import 'package:expense_tracking_application/screen/transection_page_screen.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarPageScreen extends StatefulWidget {
  const BottomNavigationBarPageScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPageScreen> createState() => _BottomNavigationBarPageScreenState();
}

class _BottomNavigationBarPageScreenState extends State<BottomNavigationBarPageScreen> {

  List<Widget> pages = [
    HomePageScreen(),
    TransectionPageScreen(),
    BudgetPageScreen(),
    ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProviderClass>(context);

    return Scaffold(

      body: pages[authProvider.currentIndex],

      bottomNavigationBar: Consumer<AuthProviderClass>(builder: (context, value, child){
        return AnimatedBottomNavigationBar(
          barColor: Colors.white,
          controller: FloatingBottomBarController(initialIndex: 0),
          bottomBar: [
            BottomBarItem(
              icon: const Icon(Icons.home, size: 32),
              iconSelected: const Icon(Icons.home,
                  color: Color(0xff7F3DFF),
                  size: 32),
              title: "Home",
              titleStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffC6C6C6)
              ),
              dotColor: Color(0xff7F3DFF),
              onTap: (val) {
                  value.setCurrentIndexFunction(val);
                //log('Home $value' as num);
              },
            ),
            BottomBarItem(
              icon: const Icon(Icons.import_export, size: 32),
              iconSelected: const Icon(Icons.import_export,
                  color: Color(0xff7F3DFF),
                  size: 32),
              title: "Transection",
              titleStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffC6C6C6)
              ),
              dotColor: Color(0xff7F3DFF),
              onTap: (val) {
                value.setCurrentIndexFunction(val);
                //log('Home $value' as num);
              },
            ),
            BottomBarItem(
              icon: const Icon(Icons.pie_chart, size: 32),
              iconSelected: const Icon(Icons.pie_chart,
                  color: Color(0xff7F3DFF),
                  size: 32),
              title: "Budget",
              dotColor: Color(0xff7F3DFF),
              onTap: (val) {
                value.setCurrentIndexFunction(val);
                //log('Home $value' as num);
              },
            ),
            BottomBarItem(
              icon: const Icon(Icons.person, size: 32),
              iconSelected: const Icon(Icons.person,
                  color: Color(0xff7F3DFF),
                  size: 32),
              title: "Profile",
              dotColor: Color(0xff7F3DFF),
              onTap: (val) {
                value.setCurrentIndexFunction(val);
                //log('Home $value' as num);
              },
            ),
            // BottomBarItem(
            //   icon:
            //   const Icon(Icons.photo, size: example.Dimens.iconNormal),
            //   iconSelected: const Icon(Icons.photo,
            //       color: example.AppColors.cherryRed,
            //       size: example.Dimens.iconNormal),
            //   title: example.Strings.search,
            //   dotColor: example.AppColors.cherryRed,
            //   onTap: (value) {
            //     setState(() {
            //       index = value;
            //     });
            //     log('Search $value');
            //   },
            // ),
            // BottomBarItem(
            //   icon:
            //   const Icon(Icons.person, size: example.Dimens.iconNormal),
            //   iconSelected: const Icon(Icons.person,
            //       color: example.AppColors.cherryRed,
            //       size: example.Dimens.iconNormal),
            //   title: example.Strings.person,
            //   dotColor: example.AppColors.cherryRed,
            //   onTap: (value) {
            //     setState(() {
            //       index = value;
            //     });
            //     log('Profile $value');
            //   },
            // ),
            // BottomBarItem(
            //   icon: const Icon(Icons.settings,
            //       size: example.Dimens.iconNormal),
            //   iconSelected: const Icon(Icons.settings,
            //       color: example.AppColors.cherryRed,
            //       size: example.Dimens.iconNormal),
            //   title: example.Strings.settings,
            //   dotColor: example.AppColors.cherryRed,
            //   onTap: (value) {
            //     setState(() {
            //       index = value;
            //     });
            //     log('Settings $value');
            //   },
            // ),
          ],
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Color(0xff7F3DFF),
            centerIcon: const FloatingCenterButton(
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(
                  Icons.download,
                  color: AppColors.white,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => IncomePageScreen()));
                },
              ),
              FloatingCenterButtonChild(
                child: const Icon(
                  Icons.upload,
                  color: AppColors.white,
                ),
                 onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensePageScreen()));
                 },
              ),
              // FloatingCenterButtonChild(
              //   child: const Icon(
              //     Icons.close,
              //     color: AppColors.white,
              //   ),
              //   // onTap: () {
              //   //   Navigator.of(context).pop();
              //   // },
              // ),
            ],
          ),
        );
      })
    );
  }
}
