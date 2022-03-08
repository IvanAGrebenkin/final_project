import 'package:flutter/material.dart';
import '../../Screens/main_screen.dart';
import '../../Screens/calculator.dart';
import '../../Screens/auth_page.dart';
import '../../Screens/counter.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ),
      ),
      // home: Calculator(),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/main_screen': (context) => const MainScreen(),
        '/nav_calculator': (context) => const Calculator(),
        '/counter': (context) => const Counter(),
      },
    );
  }
}
