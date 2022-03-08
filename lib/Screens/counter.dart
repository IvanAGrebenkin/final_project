import 'package:flutter/material.dart';
import '../Utils/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();


  int _counter = 0;
  @override
  void initState(){
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          // onPressed: _incrementCounter,
          tooltip: 'Нажатие увеличивает значение на единицу',
          child: const Icon(Icons.add),),
        body: Container (
          padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Количество нажатий кнопки:'),
                  Text(
                    // 'Счетчик',
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],),

            ),


        ),
        appBar: appBar(context),
        drawer: navDrawer(context),
      ),
    );
  }
}

// final _messengerKey = GlobalKey<ScaffoldMessengerState>();







