import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/model/personal_info.dart';
import 'package:panabo_seminar/screens/home/pages/home_page.dart';

import '../../components/app_constant.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocHome = BlocProvider.of(context)!.blocHome;
    final blocAccount = BlocProvider.of(context)!.blocAccount;
    final size = MediaQuery.of(context).size;

    return Scaffold(

      body: Column(
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: size.height * 0.2,
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(20)
                  ),
                  image: DecorationImage(image: AssetImage(AppConstant.davnorBack), fit: BoxFit.cover)
                ),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: Offset(0, 2),
                      ),
                    ]
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(AppConstant.davnorLogo))
                      ),
                    ),

                    SizedBox(width: 8),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${blocAccount.personalInfo!.firstName!} ${blocAccount.personalInfo!.middleName!.isEmpty ? "" : blocAccount.personalInfo!.middleName![0]}. ${blocAccount.personalInfo!.lastName!}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24
                            ),
                          ),

                          Text(
                            "Computer Programmer II",
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: StreamBuilder<int>(
              initialData: 0,
              stream: blocHome.streamPage,
              builder: (context, snapshotIndex) {
                var index = snapshotIndex.data!;
                return blocHome.listHomePages[index];
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: StreamBuilder<int>(
        initialData: 0,
        stream: blocHome.streamPage,
        builder: (context, snapshot) {
          var index = snapshot.data!;

          return BottomNavigationBar(
            currentIndex: index,
            onTap: (val) {
              blocHome.setHomePage(val);
            } ,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "Users"
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "User's Local"
              ),
        
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "My Profile"
              ),

            ],
          );
        }
      ),
    );
  }
}