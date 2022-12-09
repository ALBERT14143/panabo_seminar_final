import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';

import '../../../model/personal_info.dart';

class UsersLocal extends StatelessWidget {
  const UsersLocal({super.key});

  @override
  Widget build(BuildContext context) {
    final blocHome = BlocProvider.of(context)!.blocHome;
    
    return FutureBuilder<List<PersonalInfo>>(
      future: blocHome.getUsersLocal(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listUser = snapshot.data!;
          var colors = [
            Color.fromARGB(255, 50, 95, 242),
            Color.fromARGB(255, 52, 136, 239),
            Color.fromARGB(255, 9, 121, 181),
            Color.fromARGB(255, 157, 76, 223),
            Color.fromARGB(255, 115, 71, 141),
            Color.fromARGB(255, 88, 73, 190)
          ];

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: listUser.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colors[Random().nextInt(colors.length)],
                    child: Text(listUser[index].firstName!.isEmpty ? "A" : listUser[index].firstName![0].toUpperCase()),
                  ),
                  title: Text("${listUser[index].firstName} ${listUser[index].middleName} ${listUser[index].lastName}"),
                  subtitle: Text(listUser[index].userId!),
                  onTap: () {
                    // Navigator.pushNamed(context, UserDetails.id);
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}