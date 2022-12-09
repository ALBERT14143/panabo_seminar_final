import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';

class UserDetails extends StatelessWidget {
  static const String id = "/user_details";
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final blocHome = BlocProvider.of(context)!.blocHome;
    final blocAccount = BlocProvider.of(context)!.blocAccount;

    return Scaffold(
      body: Container(
        child: Text(blocHome.personalInfos!.length.toString(), style: TextStyle(fontSize: 32),),
      ),
    );
  }
}