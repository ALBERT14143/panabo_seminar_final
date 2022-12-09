import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/components/app_constant.dart';
import 'package:panabo_seminar/screens/auth/registration_screen.dart';
import 'package:panabo_seminar/screens/home/home_screen.dart';

import '../../components/app_button.dart';
import '../../components/app_textfield.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccount = BlocProvider.of(context)!.blocAccount;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(AppConstant.davnorLogo),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Provincial Government Of Davao del Norte",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
                ),
              ),
              SizedBox(height: 8),
              AppTextfield(
                controller: blocAccount.usernameCtrlr,
                hintText: "Username",
                prefixIcon: Icon(Icons.person),
              ),
              AppTextfield(
                controller: blocAccount.passwordCtrlr,
                hintText: "Password",
                prefixIcon: Icon(Icons.key),
                obscureText: true,
              ),
              SizedBox(height: 32),
              StreamBuilder<bool>(
                initialData: false,
                stream: blocAccount.streamLoading,
                builder: (context, snapshot) {
                  if (snapshot.data!) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppButton(
                          title: "LOGIN",
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            blocAccount.setLoadingEvent(true);

                            await blocAccount.login().then((value) {
                              blocAccount.setLoadingEvent(false);
                              blocAccount.setSharedAccount(value);
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.id);
                            }, onError: (error) {
                              blocAccount.setLoadingEvent(false);
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        child: Container(
                                          padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Icon(Icons.info,
                                                  color: Colors.red),
                                              SizedBox(width: 16),
                                              Text(error.toString()),
                                            ],
                                          ),
                                        ),
                                      ));
                            });
                          },
                        ),
                        AppButton(
                          title: "REGISTER",
                          onPressed: () {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
