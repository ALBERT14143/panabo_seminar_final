import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/components/app_button.dart';
import 'package:panabo_seminar/components/app_constant.dart';

import '../components/profile_details_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccount = BlocProvider.of(context)!.blocAccount;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ProfileDetailsItem(
                  title: "Albert M. Catorsi",
                  icon: Icons.person,
                ),

                ProfileDetailsItem(
                  title: "Asuncion Canatan",
                  icon: Icons.pin_drop,
                ),
                
                ProfileDetailsItem(
                  title: "Username",
                  icon: Icons.person,
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppButton(
                color: Colors.indigo,
                title: "UPDATE PROFILE", 
                onPressed: () {
                  
                }
              ),

              AppButton(
                color: Colors.red,
                title: "LOGOUT", 
                onPressed: () {
                  
                }
              ),
            ],
          ),
        ),

        // AppButton(
        //   title: "PICK IMAGE",
        //   onPressed: () {
        //     blocAccount.pickFile();
        //   },
        // ),

        // AppButton(
        //   title: "UPLOAD",
        //   onPressed: () {
        //     blocAccount.upload();
        //   },
        // ),
      ],
    );
  }
}