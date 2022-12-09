import 'package:flutter/cupertino.dart';
import 'package:panabo_seminar/bloc_provider/blocs/bloc_account.dart';
import 'package:panabo_seminar/bloc_provider/blocs/bloc_home.dart';

class BlocProvider extends InheritedWidget{

  final BlocAccount blocAccount;
  final BlocHome blocHome;

  const BlocProvider({
    required this.blocAccount,
    required this.blocHome,
    required Widget child,
    Key? key
  }) : super(child: child, key: key);


  static BlocProvider? of(BuildContext context)
    => context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}

abstract class BlocBase{
  void dispose();
}