import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/screens/auth/login_screen.dart';
import 'package:panabo_seminar/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccount = BlocProvider.of(context)!.blocAccount;

    return Scaffold(
      body: FutureBuilder<bool>(
        future: blocAccount.checkSharedAccount(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          } else {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 50.0,
              ),
            );
          }
        }
      ),
    );
  }
}