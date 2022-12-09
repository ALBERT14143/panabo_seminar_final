import 'package:flutter/material.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/bloc_provider/blocs/bloc_account.dart';
import 'package:panabo_seminar/bloc_provider/blocs/bloc_home.dart';
import 'package:panabo_seminar/screens/auth/login_screen.dart';
import 'package:panabo_seminar/screens/auth/registration_screen.dart';
import 'package:panabo_seminar/screens/home/home_screen.dart';
import 'package:panabo_seminar/screens/home/user_details.dart';
import 'package:panabo_seminar/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final BlocAccount blocAccount = BlocAccount();
  final BlocHome blocHome = BlocHome();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocAccount: blocAccount,
      blocHome: blocHome,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Panabo Seminar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id:(context) => HomeScreen(),
          UserDetails.id: (context) => UserDetails()
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    blocAccount.dispose();
    blocHome.dispose();
  }
}