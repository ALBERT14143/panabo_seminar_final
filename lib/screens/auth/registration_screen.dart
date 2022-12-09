import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/components/app_button.dart';
import 'package:panabo_seminar/components/app_constant.dart';
import 'package:panabo_seminar/components/app_textfield.dart';
import 'package:panabo_seminar/screens/auth/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = "/registration";
  const RegistrationScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final blocAccount = BlocProvider.of(context)!.blocAccount;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Hero(
                    tag: "logo",
                    child: Image.asset(
                      AppConstant.davnorLogo
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Provincial Government Of Davao del Norte",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 32,),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                    ),
                  ),
                ),
                SizedBox(height: 8),
                AppTextfield(
                  controller: blocAccount.firstNameCtrlr,
                  hintText: "First Name", 
                  prefixIcon: Icon(Icons.person)
                ),

                AppTextfield(
                  controller: blocAccount.middleNameCtrlr,
                  hintText: "Middle Name", 
                  prefixIcon: Icon(Icons.person)
                ),

                AppTextfield(
                  controller: blocAccount.lastNameCtrlr,
                  hintText: "Last Name", 
                  prefixIcon: Icon(Icons.person)
                ),

                AppTextfield(
                  controller: blocAccount.addressCtrlr,
                  hintText: "Address", 
                  prefixIcon: Icon(Icons.pin_drop)
                ),

                AppTextfield(
                  controller: blocAccount.usernameCtrlr,
                  hintText: "Username", 
                  prefixIcon: Icon(Icons.person)
                ),

                AppTextfield(
                  controller: blocAccount.passwordCtrlr,
                  hintText: "Password", 
                  prefixIcon: Icon(Icons.key),
                  obscureText: true,
                ),

                SizedBox(height: 16),

                AppButton(
                  title: "Register", 
                  onPressed: (){
                    // blocAccount.register();
                    showDialog(
                      context: context, 
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                          child: FutureBuilder<String>(
                            future: blocAccount.register(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green, size: 80),
                                    SizedBox(height: 8),
                                    Text(
                                      "Registration Success",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    AppButton(
                                      title: "Proceed to Login", 
                                      onPressed: (){
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    )
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(Icons.info, color: Colors.red),
                                      SizedBox(width: 16),
                                      Text(snapshot.error.toString()),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(width: 16),
                                      Text("Please wait..."),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        ),
                      )
                    );
                  }
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}