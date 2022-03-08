// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Utils/widgets.dart';




// class SharedPrefScreen extends StatefulWidget {
//   const SharedPrefScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SharedPrefScreen> createState() => _SharedPrefScreenState();
// }

// class _SharedPrefScreenState extends State<SharedPrefScreen> {
//   final _messengerKey = GlobalKey<ScaffoldMessengerState>();
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       scaffoldMessengerKey: _messengerKey,
//       title: 'Shared preferences demo',
//       home: MyHomePage (title: 'Shared preferences demo'),
//     );
//   }
//
//
// }
//
//
// // class SharedPrefScreen extends StatelessWidget {
// //  const SharedPrefScreen({Key? key}) : super(key: key);
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       // scaffoldMessengerKey: _messengerKey,
// //       title: 'Shared preferences demo',
// //       home: MyHomePage (title: 'Shared preferences demo'),
// //     );
// //   }
// // }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   @override
//   void initState(){
//     super.initState();
//     _loadCounter();
//   }
//
//   void _loadCounter() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = (prefs.getInt('counter') ?? 0);
//     });
//   }
//   // final _messengerKey = GlobalKey<ScaffoldMessengerState>();
//   void _incrementCounter() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = (prefs.getInt('counter') ?? 0) + 1;
//       prefs.setInt('counter', _counter);
//     });
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(context),
//       drawer: navDrawer(context),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Количество нажатий кнопки:'),
//             Text('$_counter',
//             style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: '+ Нажатие',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
