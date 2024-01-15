import 'package:expense_tracking_application/firebase_options.dart';
import 'package:expense_tracking_application/provider/auth_provider_class.dart';
import 'package:expense_tracking_application/provider/auth_services_provider_google.dart';
import 'package:expense_tracking_application/screen/bottom%20%20nav%20bar/bottom_nav_bar_page_screen.dart';
import 'package:expense_tracking_application/screen/expense_page_screen.dart';
import 'package:expense_tracking_application/screen/income_page_screen.dart';
import 'package:expense_tracking_application/screen/profile_page_screen.dart';
import 'package:expense_tracking_application/screen/splash%20screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );

 await Hive.initFlutter();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (context) => AuthProviderClass()),
          ChangeNotifierProvider(create: (context) => AuthServicesProviderGoogle()),

        ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //home: IncomePageScreen()
    ),
    );
  }
}

