import 'package:flutter/material.dart';
import '../Utils/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class Counter2Storage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter2.txt');
  }

  Future<int> readCounter2() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter2(int counter2) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter2');
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, required this.storage}) : super(key: key);

  final Counter2Storage storage;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();


  int _counter1 = 0;
  int _counter2 = 0;

  @override
  void initState(){
    super.initState();
    _loadCounter1();
    // _loadCounter2();
    widget.storage.readCounter2().then((int value) {
      setState(() {
        _counter2 = value;
      });
    });
  }

//////////////// Счетчик 1
  void _loadCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }

  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter1);
    });
  }

  void _counterReset1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = 0;
      prefs.setInt('counter1', _counter1);
    });
  }


//////////////// Счетчик 2


  Future<File> _incrementCounter2() {
    setState(() {
      _counter2++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter2(_counter2);
  }

  Future<File> _counterReset2() {
    setState(() {
      _counter2=0;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter2(_counter2);
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
        body: Container (
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Счетчик 1:'),
                const SizedBox(height:5,),
                Text(
                  '$_counter1',
                  style: Theme.of(context).textTheme.headline4,
                ), // Вывод счетчика 1
                const SizedBox(height:5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:154, height:42,
                      child: ElevatedButton(
                        onPressed: _incrementCounter1,
                        child: const Text('Инкремент',
                          style: TextStyle(
                            inherit: false,
                            fontSize:16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        ),
                      ),
                    ),
                    const SizedBox(width:25,),
                    SizedBox(width:154, height:42,
                      child: ElevatedButton(
                        onPressed: _counterReset1,
                        child: const Text('Сброс счетчика',
                          style: TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        ),
                      ),
                    ),
                  ],
                ),// Кнопки счетчика 1
                const SizedBox(height:50,),
                const Text('Счетчик 2:'),
                const SizedBox(height:5,),
                Text(
                  '$_counter2',
                  style: Theme.of(context).textTheme.headline4,
                ), // Вывод счетчика 2
                const SizedBox(height:5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:154, height:42,
                      child: ElevatedButton(
                        onPressed: _incrementCounter2,
                        child: const Text('Инкремент',
                          style: TextStyle(
                            inherit: false,
                            fontSize:16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        ),
                      ),
                    ),
                    const SizedBox(width:25,),
                    SizedBox(width:154, height:42,
                      child: ElevatedButton(
                        onPressed: _counterReset2,
                        child: const Text('Сброс счетчика',
                          style: TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        ),
                      ),
                    ),
                  ],
                ),// Кнопки счетчика 2
              ],
            ),
          ),
        ),
        appBar: appBar(context),
        drawer: navDrawer(context),
      ),
    );
  }
}

// final _messengerKey = GlobalKey<ScaffoldMessengerState>();







